--SELECT * FROM regions;
--SELECT * FROM species;
--SELECT * FROM climate;
--SELECT * FROM observations;


-- MISSION 1  ¿Cuáles son las primeras 10 observaciones registradas?;
SELECT * FROM observations LIMIT 10;


-- MISSION 2: ¿Qué identificadores de región ( region_id) aparecen en los datos?;
SELECT id FROM regions;


-- MISSION 3: ¿Cuántas especies distintas ( species_id) se han observado?;
SELECT DISTINCT scientific_name FROM species;  


-- MISSION 4: ¿Cuántas observaciones hay para la región con region_id = 2?;
SELECT COUNT(*) FROM observations WHERE region_id=2;


-- MISSION 5: ¿Cuántas observaciones se registraron el día 1998-08-08?;
SELECT COUNT(*) FROM observations WHERE observation_date = "1998-08-08";


-- MISSION 6: ¿Cuál es el region_idcon más observacionesAgrupa por región y cuenta cuantas veces aparece cada una.?
SELECT COUNT(*) fROM observations
GROUP BY region_id;


-- MISSION 7 ¿Cuáles son los 5 species_idmás frecuentes?
SELECT species_id, COUNT(*) AS contador FROM observations
GROUP BY species_id ORDER BY contador DESC LIMIT 5;          


-- MISSION 8 ¿Qué especies ( species_id) tienen menos de 5 registros?;
SELECT species_id, COUNT(*) AS contador FROM observations
GROUP BY species_id HAVING contador<5; 

-- MISION 9 ¿Qué observadores ( observer) registraron más observaciones?;
SELECT observer, COUNT(*) AS contador FROM observations
GROUP BY observer ORDER BY contador DESC LIMIT 10;

--MISSION 10 Muestra el nombre de la región ( regions.name) para cada observación;
SELECT observations.id, regions.name FROM regions
JOIN observations ON observations.region_id = regions.id;

--MISSION 11 Muestra el nombre científico de cada especie registrada ( species.scientific_name).;
SELECT DISTINCT scientific_name FROM species
JOIN observations ON observations.species_id= species.id;

-- MISSION 12 ¿Cuál es la especie más observada por cada región?;

  
SELECT tabla.region , tabla.species , MAX(tabla.total) from (
  SELECT regions.name AS region, species.common_name species, SUM(observations.count) as total
  FROM observations 
  JOIN regions ON observations.region_id=regions.id
  JOIN species ON species.id = observations.species_id
  GROUP by regions.name, species.common_name) AS tabla 
GROUP BY (tabla.region);


 
  



