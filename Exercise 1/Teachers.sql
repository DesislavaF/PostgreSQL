CREATE TABLE teachers (
    teacher_id SERIAL PRIMARY KEY,       
    name VARCHAR(100) NOT NULL,          
    subject VARCHAR(50) NOT NULL,        
    hired_at DATE NOT NULL,              
    is_active BOOLEAN DEFAULT TRUE       
);

INSERT INTO teachers (name, subject, hired_at, is_active) VALUES
('Petar Ivanov', 'Math', '2020-09-01', TRUE),
('Dinko Kolev', 'Science', '2018-08-15', TRUE),
('Daqna Ivanova', 'History', '2019-01-20', FALSE);


SELECT * FROM teachers;



