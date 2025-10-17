--DATA EXPLORATION
--Total count of companies
Select count(company) as TotalNoOfCompanies
from UnicornCompanies;--1061

--Total count of Countries
Select count(distinct(Country)) as TotalNoOfCountries
from UnicornCompanies;--46

--Which companies have the biggest return on investment
Select Company,((Cast(Valuation as bigint)- CAST(Funding as bigint))/Cast(Funding as bigint)) as ReturnOnInvestment
from UnicornCompanies
order by ReturnOnInvestment desc;

--Top 10
--Zapier, Dunamu, Workhuman, CFGI, Manner, DJI Innovations, GalaxySpace, Canva, II Makiage, Revolution Precrafted


--How long does it take for a company to become a Unicorn?
Select avg(Year - Yearfounded) as AverageTime  from UnicornCompanies;
--6.9 years

--Which industry has most Unicorns?
Select Industry, count(company) as NumberOfUnicorns from UnicornCompanies
group by Industry
order by count(company) desc;
--Top 3 are Fintech, Internet software & services, E-commerce & direct-to-consumer

--Which countries have most Unicorns?
Select country, count(company) as NumberOfUnicorns from UnicornCompanies
Group by Country
order by count(country) desc;
--Top 3 are United States, China, India

SELECT TOP 10 Country, COUNT(1) AS Frequency, CAST(COUNT(1) * 100.0 / (SELECT COUNT(*) FROM UnicornCompanies) AS INT) AS 'Percentage'
FROM UnicornCompanies
WHERE (Year - YearFounded) >= 0
GROUP BY Country
ORDER BY Count(1) DESC;

--Which investors have funded the most startups?
Select * from UnicornCompanies;

UPDATE UnicornCompanies
SET SelectInvestors = REPLACE(SelectInvestors, ', ', ',');

SELECT TOP 10 value AS Investors, COUNT(*) AS UnicornsInvested 
FROM UnicornCompanies
    CROSS APPLY STRING_SPLIT(SelectInvestors, ',')  
GROUP BY value  
ORDER BY COUNT(*) DESC ;
--Accel, Tiger Global Management
