---------------------------------------------------
-- PATIENTS
---------------------------------------------------

SELECT * FROM PATIENTS;

---------------------------------------------------
-- DOCTORS
---------------------------------------------------

SELECT * FROM DOCTORS;

---------------------------------------------------
-- APPOINTMENTS
---------------------------------------------------

SELECT
    a.appointment_id,
    p.first_name AS patient_name,
    d.doctor_name,
    a.appointment_date,
    a.status
FROM appointments a
JOIN patients p
ON a.patient_id = p.patient_id
JOIN doctors d
ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_id;

---------------------------------------------------
-- BILLS
---------------------------------------------------

SELECT
    b.bill_id,
    p.first_name AS patient_name,
    b.total_amount,
    b.payment_status
FROM bills b
JOIN patients p
ON b.patient_id = p.patient_id
ORDER BY b.bill_id;

---------------------------------------------------
-- LAB ORDERS
---------------------------------------------------

SELECT
    l.order_id,
    p.first_name AS patient_name,
    d.doctor_name,
    l.order_date,
    l.status
FROM lab_orders l
JOIN patients p
ON l.patient_id = p.patient_id
JOIN doctors d
ON l.doctor_id = d.doctor_id
ORDER BY l.order_id;

---------------------------------------------------
-- TEST_MASTER
---------------------------------------------------

SELECT *
FROM TEST_MASTER
ORDER BY TEST_ID;

---------------------------------------------------
-- TEST_RESULTS
---------------------------------------------------

SELECT *
FROM TEST_RESULTS
ORDER BY RESULT_ID;

---------------------------------------------------
-- LAB_RESULTS
---------------------------------------------------

SELECT *
FROM LAB_RESULTS
ORDER BY LAB_ID;
