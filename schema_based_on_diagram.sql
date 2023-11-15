CREATE TABLE patients(
id  SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
date_of_birth DATE
);

CREATE TABLE medical_histories(
id  SERIAL PRIMARY KEY,
admitted_at TIMESTAMP,
patient_id INT REFERENCES patients(id),
status VARCHAR(50)
);

CREATE TABLE treatments(
id  SERIAL PRIMARY KEY,
type TIMESTAMP,
name VARCHAR(50)
);