CREATE TABLE patients(
patient_id  SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
date_of_birth DATE
);

CREATE TABLE medical_histories(
medical_histories_id  SERIAL PRIMARY KEY,
admitted_at TIMESTAMP,
patient_id INT REFERENCES patients(id),
status VARCHAR(50)
);

CREATE TABLE treatments(
treament_id  SERIAL PRIMARY KEY,
type VARCHAR(25),
name VARCHAR(50)
);

CREATE TABLE invoices(
invoice_id  SERIAL PRIMARY KEY,
total_amount DECIMAL(5, 2),
generated_at TIMESTAMP,
payed_at TIMESTAMP,
medical_history_id INT UNIQUE REFERENCES medical_histories(medical_histories_id)
);

CREATE TABLE invoice_items(
 invoice_items_id SERIAL PRIMARY KEY,
 unit_price DECIMAL(5, 2),
 quantity INT,
 total_price DECIMAL(5, 2),
 invoice_id INT REFERENCES invoices(id),
 treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE medical_treatment(
    medical_history_id INT REFERENCES medical_histories(medical_histories_id),
    medical_treatment_id INT REFERENCES treatments(treatment_id),
    FOREIGN KEY(medical_history_id, medical_treatment_id)
);

-- Create Index on foreign keys

CREATE INDEX idx_med_hist_patient_id ON medical_histories(patient_id);
CREATE INDEX idx_invoices_med_hist_id ON invoices(medical_history_id);
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items(treatment_id);
CREATE INDEX idx_med_treatment_id ON medical_treatment(medical_history_id);
CREATE INDEX idx_med_treatment_id ON medical_treatment(medical_treatment_id);