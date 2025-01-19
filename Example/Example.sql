
DROP TABLE IF EXISTS class CASCADE;


CREATE TABLE class (
    class_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW()
);


DROP TABLE IF EXISTS students CASCADE;


CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    class_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_class_id
    FOREIGN KEY (class_id) 
    REFERENCES class(class_id)
);

ALTER TABLE students
ADD CONSTRAINT fk_class
FOREIGN KEY (class_id)
REFERENCES class(id)
ON DELETE CASCADE;
