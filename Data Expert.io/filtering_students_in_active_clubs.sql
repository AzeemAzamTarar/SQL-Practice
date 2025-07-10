-- Question: Filtering Students in Active Clubs

-- Given tables clubs (id: unique club id, name: club name) and students (id: unique student id, name: student name, club_id: club's id), return a list from the students table for those who are in clubs that still exist in the clubs table. The result should have three columns (id, name, club_id) and be sorted by students' ids (id) and include only those students whose club_id matches an id in the clubs table.

-- These are the tables to query for this question:

-- playground.clubs
    -- id int
    -- name string
    -- playground.students
    -- d int
    -- name string
    -- club_id int


-- Your answer should include these columns:
    -- id integer
    -- name varchar
    -- club_id integer


SELECT 
    s.id, 
    s.name, 
    s. club_id
FROM playground.clubs c
INNER JOIN playground.students s on c.id = s.club_id
ORDER BY s.id