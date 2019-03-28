CREATE TABLE Employees(
	emp_no INT NOT NULL, 
	PRIMARY KEY (emp_no) 
	);


CREATE TABLE Clients(
    client_id INT NOT NULL,
    emp_no INT, 
    PRIMARY KEY (client_id),
    INDEX client_id_idx(client_id ASC),
    CONSTRAINT fk_emp_cli_no FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
    );


CREATE TABLE Politics(
	politics_id INT NOT NULL,
	emp_no INT, 
	INDEX politics_id_idx(politics_id ASC),
	PRIMARY KEY (politics_id), 
	CONSTRAINT fk_emp_pol_no FOREIGN KEY(emp_no) REFERENCES Employees (emp_no)
	);

CREATE TABLE Plantation(
	plan_id INT NOT NULL,
	plan_name VARCHAR(55),
	plan_address VARCHAR(100),
	INDEX plan_id_idx (plan_id ASC),
	INDEX plan_name_idx (plan_name ASC),
	INDEX plan_address_idx (plan_address ASC),
	PRIMARY KEY (plan_id)
);


CREATE TABLE Emp_Plan(
	emp_no INT NOT NULL,
	plan_id INT NOT NULL,
	FOREIGN KEY (emp_no)
	REFERENCES Employees(emp_no),
	FOREIGN KEY (plan_id)
	REFERENCES Plantation (plan_id)
);


CREATE TABLE Labolatory(
	lab_id INT NOT NULL,
	lab_name VARCHAR(100),
	PRIMARY KEY (lab_id),
	INDEX lab_name_idx (lab_name ASC)
);

CREATE TABLE Lab_Emp(
	lab_id INT NOT NULL,
	emp_no INT NOT NULL,
	INDEX lab_id_idx(lab_id ASC),
	INDEX emp_no_idx(emp_no ASC),
	CONSTRAINT fk_lab_emp_id FOREIGN KEY (lab_id) REFERENCES Labolatory(lab_id),
	CONSTRAINT fk_emp_no FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	);

CREATE TABLE Warhouse(
	war_id INT NOT NULL,
	war_name VARCHAR(100),
	war_address VARCHAR(100),
	PRIMARY KEY (war_id),
	INDEX war_id_idx(war_id ASC),
	INDEX war_name_idx(war_name ASC),
	INDEX war_address_idx(war_address ASC)
	);

CREATE TABLE Equipment(
	equip_id INT NOT NULL,
	equip_name VARCHAR(200),
	equip_type VARCHAR(100),
	war_id INT NOT NULL,
	lab_id INT NOT NULL,
	PRIMARY KEY(equip_id),
	INDEX equip_name_idx(equip_name ASC),
	CONSTRAINT fk_war_id
	FOREIGN KEY (war_id)
	REFERENCES Warhouse (war_id),
	CONSTRAINT fk_lab_id
	FOREIGN KEY (lab_id)
	REFERENCES Labolatory (lab_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
	);
