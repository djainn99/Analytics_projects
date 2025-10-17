Select * from UnicornCompanies
where company in ('Bolt', 'Fabric');

--DATA CLEANING
--Duplicate records
Select company, count(Company)
		From UnicornCompanies
		group by company
		having count(company)>1;
--bolt and fabric are duplicates but Records have different industry and different cities associated to each


--Rename column names
EXEC sp_rename 'dbo.UnicornCompanies.[Year Founded]', 'YearFounded', 'COLUMN';
EXEC sp_rename 'dbo.UnicornCompanies.[Date Joined]', 'DateJoined', 'COLUMN';
EXEC sp_rename 'dbo.UnicornCompanies.[Select Investors]', 'SelectInvestors', 'COLUMN';

-- Standardize date joined format & break out date joined into individual columns (Year, Month, Day)

ALTER TABLE UnicornCompanies
ADD DateJoinedConverted DATE;
UPDATE UnicornCompanies
SET DateJoinedConverted = CONVERT(DATE, DateJoined);

ALTER TABLE UnicornCompanies
ADD Year INT;
UPDATE UnicornCompanies
SET Year = DATEPART(YEAR, DateJoinedConverted);

ALTER TABLE UnicornCompanies
ADD Month INT;
UPDATE UnicornCompanies
SET Month = DATEPART(MONTH, DateJoinedConverted);

ALTER TABLE UnicornCompanies
ADD Day INT;
UPDATE UnicornCompanies
SET Day = DATEPART(DAY, DateJoinedConverted);

-- Drop rows where Funding column contain 0 or Unknown

DELETE FROM UnicornCompanies
WHERE Funding IN ('$0M', 'Unknown');

-- Reformat currency value
-- "Valuation" and "Funding" columns
UPDATE UnicornCompanies
SET Valuation = RIGHT(Valuation, LEN(Valuation) - 1);

UPDATE UnicornCompanies
SET Valuation = REPLACE(REPLACE(Valuation, 'B','000000000'), 'M', '000000');

UPDATE UnicornCompanies
SET Funding = RIGHT(Funding, LEN(Funding) - 1);

UPDATE UnicornCompanies
SET Funding = REPLACE(REPLACE(Funding, 'B','000000000'), 'M', '000000');

Select * from UnicornCompanies order by company;

-- Delete Unused Columns
ALTER TABLE UnicornCompanies
DROP COLUMN DateJoined;
EXEC sp_rename 'dbo.UnicornCompanies.DateJoinedConverted', 'DateJoined', 'COLUMN';