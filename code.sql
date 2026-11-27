DROP TABLE IF EXISTS Workload;
DROP TABLE IF EXISTS Teachers;
CREATE TABLE Teachers (
    teacher_id SERIAL PRIMARY KEY,
    last_name CHARACTER VARYING(50) NOT NULL,
    first_name CHARACTER VARYING(50) NOT NULL,
    middle_name CHARACTER VARYING(50),
    education CHARACTER VARYING(100) NOT NULL,
    experience INTEGER NOT NULL,
    department_number INTEGER NOT NULL,
    phone CHARACTER VARYING(20) NOT NULL
);
CREATE TABLE workload (
    teacher_id INTEGER NOT NULL,
    discipline_id INTEGER NOT NULL,
    hour_cost NUMERIC(10, 2) NOT NULL,
    is_hourly_paid BOOLEAN NOT NULL,
    PRIMARY KEY (teacher_id, discipline_id),
    FOREIGN KEY (teacher_id) REFERENCES Teachers (teacher_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
INSERT INTO Teachers (last_name, first_name, middle_name, education, experience, department_number, phone) VALUES
('Иванов', 'Иван', 'Иванович', 'Высшее, кандидат технических наук', 15, 101, '+79001112233'),
('Петрова', 'Анна', 'Сергеевна', 'Высшее, доктор физико-математических наук', 22, 102, '+79001112234'),
('Сидоров', 'Алексей', 'Петрович', 'Высшее, магистр', 5, 101, '+79001112235'),
('Козлова', 'Елена', 'Викторовна', 'Высшее, кандидат экономических наук', 12, 103, '+79001112236'),
('Смирнов', 'Дмитрий', 'Александрович', 'Высшее, аспирантура', 3, 102, '+79001112237'),
('Новикова', 'Ольга', 'Николаевна', 'Высшее, кандидат педагогических наук', 18, 104, '+79001112238'),
('Морозов', 'Сергей', NULL, 'Высшее, специалист', 8, 101, '+79001112239'),
('Волкова', 'Мария', 'Дмитриевна', 'Высшее, кандидат технических наук', 10, 103, '+79001112240'),
('Соколов', 'Андрей', 'Олегович', 'Высшее, доктор технических наук', 27, 104, '+79001112241'),
('Лебедева', 'Татьяна', 'Игоревна', 'Высшее, магистр', 4, 102, '+79001112242');
INSERT INTO Workload (teacher_id, discipline_id, hour_cost, is_hourly_paid) VALUES
(1, 501, 1200.00, FALSE),
(1, 502, 1350.50, TRUE),
(2, 503, 1800.00, FALSE),
(3, 501, 900.00, TRUE),
(4, 504, 1150.00, FALSE),
(5, 505, 850.00, TRUE),
(6, 506, 1250.00, FALSE),
(7, 502, 1000.00, TRUE),
(8, 507, 1300.00, FALSE),
(9, 508, 1950.00, FALSE);
