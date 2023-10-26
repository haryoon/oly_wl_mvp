USE oly_wl; 

-- View all movement options
SELECT movement,target_area,equipment,movement_type FROM movement
INNER JOIN target_area ON movement.target_area_id = target_area.target_area_id
INNER JOIN equipment ON movement.equipment_id = equipment.equipment_id
INNER JOIN movement_type ON movement.movement_type_id = movement_type.movement_type_id
ORDER BY movement;

-- View all Strength/Power movements using Barbell as Equipment
SELECT movement,target_area,equipment,movement_type FROM movement
INNER JOIN target_area ON movement.target_area_id = target_area.target_area_id
INNER JOIN equipment ON movement.equipment_id = equipment.equipment_id
INNER JOIN movement_type ON movement.movement_type_id = movement_type.movement_type_id
WHERE movement_type = 'Strength/Power' and equipment = 'Barbell'
ORDER BY movement;
    
-- View all top sets of Strength/Power movements w/ Barbell
SELECT movement,rep,MAX(weight) AS weight_kg,ROUND(MAX(weight) * 2.20462,0) AS weight_lb FROM movement
INNER JOIN equipment ON movement.equipment_id = equipment.equipment_id
INNER JOIN movement_type ON movement.movement_type_id = movement_type.movement_type_id
INNER JOIN sets ON movement.movement_id = sets.movement_id
WHERE movement_type = 'Strength/Power' and equipment = 'Barbell'
GROUP BY movement, rep;
    
-- View Snatch History (1 out of the 2 Olympic Lifts)
SELECT set_date AS 'date',movement,rep,weight AS weight_kg,ROUND(weight * 2.20462,0) AS weight_lb FROM movement
INNER JOIN sets ON movement.movement_id = sets.movement_id
WHERE movement = 'Snatch'
ORDER BY set_date DESC;

-- View Clean and Jerk History (the other Oympic Lift)
SELECT set_date AS 'date',movement,rep,weight AS weight_kg,ROUND(weight * 2.20462,0) AS weight_lb FROM movement
INNER JOIN sets ON movement.movement_id = sets.movement_id
WHERE movement = 'USAW Clean and Jerk'
ORDER BY set_date DESC;

-- Last workout date
SELECT MAX(set_date) AS last_workout_date FROM sets;

-- Days since last workout
SELECT((SELECT CURDATE()) - (SELECT MAX(set_date) FROM sets)) AS 'day(s) since last workout';