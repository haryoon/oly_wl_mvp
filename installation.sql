DROP DATABASE IF EXISTS oly_wl;
CREATE DATABASE oly_wl;
USE oly_wl; 

-- Create target_area table
CREATE TABLE target_area (
	target_area_id INT AUTO_INCREMENT PRIMARY KEY,
    target_area VARCHAR(40));

-- Insert target_area options (look up table)
INSERT INTO target_area (target_area) VALUES
('All'),
('Upper Body'),
('Mid Body'),
('Lower Body');

-- Create movement_type table
CREATE TABLE movement_type (
	movement_type_id INT AUTO_INCREMENT PRIMARY KEY,
    movement_type VARCHAR(40));

-- Insert movement type options (look up table)
INSERT INTO movement_type (movement_type) VALUES
('General Prep'),
('Strength/Power'),
('Mobility/Flexibility'),
('Speed/Agility'),
('Cardio/Endurance'),
('Skill/Coordination/Balance');

-- Create equipment table
CREATE TABLE equipment (
	equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    equipment VARCHAR(40));

-- Insert equipment options (look up table)
INSERT INTO equipment (equipment) VALUES
('Barbell'),
('Kettlebell'),
('Dumbbell'),
('Gymnastics Rings'),
('Pull Up Bar'),
('Bands'),
('Pull Up Bar'),
('Plyometrics Box'),
('Bodyweight'),
('Other');

-- Create movement table
CREATE TABLE movement (
	movement_id INT AUTO_INCREMENT PRIMARY KEY,
    movement VARCHAR(100),
    target_area_id INT,
    equipment_id INT,
    movement_type_id INT,
	FOREIGN KEY(target_area_id) REFERENCES target_area(target_area_id) ON DELETE SET NULL,
	FOREIGN KEY(equipment_id) REFERENCES equipment(equipment_id) ON DELETE SET NULL,
	FOREIGN KEY(movement_type_id) REFERENCES movement_type(movement_type_id) ON DELETE SET NULL);

-- Create sets table
CREATE TABLE sets (
	set_id INT AUTO_INCREMENT PRIMARY KEY,
    set_date DATE,
    movement_id INT,
    rep INT,
    time_rep INT,
    weight INT,
	FOREIGN KEY(movement_id) REFERENCES movement(movement_id) ON DELETE SET NULL);