Select * from circuits;--sort
Select * from constructors;--sort

Select * from drivers;--sort
Select * from constructor_results;
ALTER TABLE constructor_results 
ADD CONSTRAINT constraint_fkey 
FOREIGN KEY (constructorId) REFERENCES constructors(constructorid);
ALTER TABLE constructor_results 
ADD CONSTRAINT constraint_fkey21 
FOREIGN KEY (raceId) REFERENCES races(raceid);

Select * from races;
ALTER TABLE races
ADD CONSTRAINT constraint_fkey20 
FOREIGN KEY (circuitID) REFERENCES circuits(circuitid);

Select * from constructor_standings;
ALTER TABLE constructor_standings
ADD CONSTRAINT constraint_fkey1 
FOREIGN KEY (constructorId) REFERENCES constructors(constructorid);
ALTER TABLE constructor_standings
ADD CONSTRAINT constraint_fkey2
FOREIGN KEY (raceId) REFERENCES races(raceid);

Select * from driver_standings;
ALTER TABLE driver_standings
ADD CONSTRAINT constraint_fkey4
FOREIGN KEY (raceId) REFERENCES races(raceid);
ALTER TABLE driver_standings
ADD CONSTRAINT constraint_fkey5
FOREIGN KEY (driverid) REFERENCES drivers(driverid);

Select * from lap_times;
ALTER TABLE lap_times
ADD CONSTRAINT constraint_fkey6
FOREIGN KEY (raceId) REFERENCES races(raceid);
ALTER TABLE lap_times
ADD CONSTRAINT constraint_fkey7
FOREIGN KEY (driverid) REFERENCES drivers(driverid);

Select * from qualifying;
ALTER TABLE qualifying
ADD CONSTRAINT constraint_fkey8
FOREIGN KEY (raceId) REFERENCES races(raceid);
ALTER TABLE qualifying
ADD CONSTRAINT constraint_fkey9
FOREIGN KEY (driverid) REFERENCES drivers(driverid);
ALTER TABLE qualifying
ADD CONSTRAINT constraint_fkey10 
FOREIGN KEY (constructorId) REFERENCES constructors(constructorid);


Select * from results;
ALTER TABLE results
ADD CONSTRAINT constraint_fkey11
FOREIGN KEY (raceId) REFERENCES races(raceid);
ALTER TABLE results
ADD CONSTRAINT constraint_fkey12
FOREIGN KEY (driverid) REFERENCES drivers(driverid);
ALTER TABLE results
ADD CONSTRAINT constraint_fkey13
FOREIGN KEY (constructorId) REFERENCES constructors(constructorid);
ALTER TABLE results
ADD CONSTRAINT constraint_fkey18
FOREIGN KEY (statusId) REFERENCES status(statusid);


Select * from seasons;--sort

Select * from sprint_results;
ALTER TABLE sprint_results
ADD CONSTRAINT constraint_fkey14
FOREIGN KEY (resultId) REFERENCES results(resultid);
ALTER TABLE sprint_results
ADD CONSTRAINT constraint_fkey15
FOREIGN KEY (raceId) REFERENCES races(raceid);
ALTER TABLE sprint_results
ADD CONSTRAINT constraint_fkey16
FOREIGN KEY (driverid) REFERENCES drivers(driverid);
ALTER TABLE sprint_results
ADD CONSTRAINT constraint_fkey17
FOREIGN KEY (constructorId) REFERENCES constructors(constructorid);
ALTER TABLE sprint_results
ADD CONSTRAINT constraint_fkey19
FOREIGN KEY (statusId) REFERENCES status(statusid);

Select * from status;