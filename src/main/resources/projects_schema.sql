DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
  project_id INT AUTO_INCREMENT NOT NULL,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7, 2),
  actual_hours DECIMAL(7, 2),
  difficulty INT,
  notes TEXT,
  PRIMARY KEY (project_id)
);

CREATE TABLE category (
  category_id INT AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(128) NOT NULL,
  PRIMARY KEY (category_id)
);

CREATE TABLE step (
  step_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  PRIMARY KEY (step_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
  material_id INT AUTO_INCREMENT NOT NULL,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7, 2),
  PRIMARY KEY (material_id),
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project_category (
  project_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
  FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
  UNIQUE KEY (project_id, category_id)
);

INSERT into project (project_name, estimated_hours, actual_hours, difficulty, notes) values ("Jirachi", 160.00, 37.5, 5, "This is a really long hunt!");
INSERT into project (project_name, estimated_hours, actual_hours, difficulty, notes) values ("Celebi", 160.00, 80, 2, "This is relatively easy!");
INSERT into project (project_name, estimated_hours, actual_hours, difficulty, notes) values ("Mew", 160.00, 20, 2, "This is hard to set up but goes quickly!");
INSERT into project (project_name, estimated_hours, actual_hours, difficulty, notes) values ("Deoxys", 160.00, 0.5, 1, "This is hard to set up but goes quickly!");


INSERT into material (project_id, material_name, num_required, cost) values (1, "Pokemon Emerald", 1, 100.00);
INSERT into material (project_id, material_name, num_required, cost) values (1, "GameBoy Advanced", 1, 70.00);
INSERT into material (project_id, material_name, num_required, cost) values (1, "Game Cube", 1, 100.00);
INSERT into material (project_id, material_name, num_required, cost) values (1, "Link Cable", 1, 10.00);
INSERT into material (project_id, material_name, num_required, cost) values (1, "Bonus Jirachi Disc", 1, 200.00);

INSERT into material (project_id, material_name, num_required, cost) values (2, "Pokemon Crystal VC", 1, 10.00);
INSERT into material (project_id, material_name, num_required, cost) values (2, "3DS", 1, 150.00);

INSERT into material (project_id, material_name, num_required, cost) values (3, "Pokemon Emerald", 1, 100.00);
INSERT into material (project_id, material_name, num_required, cost) values (3, "GameBoy Advanced", 1, 70.00);
INSERT into material (project_id, material_name, num_required, cost) values (3, "SD Card", 1, 10.00);
INSERT into material (project_id, material_name, num_required, cost) values (3, "Laptop", 1, 200.00);
INSERT into material (project_id, material_name, num_required, cost) values (3, "PKHeX", 1, 0.00);

INSERT into material (project_id, material_name, num_required, cost) values (4, "Pokemon Emerald", 1, 100.00);
INSERT into material (project_id, material_name, num_required, cost) values (4, "GameBoy Advanced", 1, 70.00);
INSERT into material (project_id, material_name, num_required, cost) values (3, "SD Card", 1, 10.00);
INSERT into material (project_id, material_name, num_required, cost) values (3, "Laptop", 1, 200.00);
INSERT into material (project_id, material_name, num_required, cost) values (3, "PKHeX", 1, 0.00);

INSERT into step (project_id, step_text, step_order) values (1, "Soft Reset", 1);
INSERT into step (project_id, step_text, step_order) values (2, "Soft Reset", 1);
INSERT into step (project_id, step_text, step_order) values (3, "Soft Reset", 1);
INSERT into step (project_id, step_text, step_order) values (4, "Soft Reset", 1);

INSERT into category (category_name) values ("Shiny Hunt");
INSERT into category (category_name) values ("Gen 3");
INSERT into category (category_name) values ("GameCube");

INSERT into project_category (project_id, category_id) values (1, 1);
INSERT into project_category (project_id, category_id) values (1, 2);
INSERT into project_category (project_id, category_id) values (1, 3);

INSERT into project_category (project_id, category_id) values (2, 1);

INSERT into project_category (project_id, category_id) values (3, 1);
INSERT into project_category (project_id, category_id) values (3, 2);

INSERT into project_category (project_id, category_id) values (4, 1);
INSERT into project_category (project_id, category_id) values (4, 2);
