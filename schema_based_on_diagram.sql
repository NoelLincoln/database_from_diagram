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

CREATE TABLE invoices(
id  SERIAL PRIMARY KEY,
total_amount DECIMAL(5, 2),
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT UNIQUE REFERENCES medical_histories(id)
);

CREATE TABLE invoices_items(
 id SERIAL PRIMARY KEY,
 unit_price DECIMAL(5, 2),
 quantity INT,
 total_price DECIMAL(5, 2),
 invoice_id INT REFERENCES invoices(id),
 treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE medical_treatment(
    medical_history_id INT REFERENCES medical_histories(id),
    medical_treatment_id INT REFERENCES treatments(id),
    PRIMARY KEY(medical_history_id, medical_treatment_id)
);