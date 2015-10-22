-- switch out of database, then you can drop the database
\c StyeL

-- 1) delete a user named michael if it exists
DROP USER IF EXISTS "michael";

-- 2) Write a query to create a user named michael with an encrypted password stonebreaker
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';

-- 3) Drop DB if it exists
DROP DATABASE IF EXISTS todo_app;

-- 4) Create a database named todo_app
CREATE DATABASE todo_app;

-- 5) connect to the newly created database
\c todo_app;

-- 6) query to create a table named task
CREATE TABLE tasks (
id serial,
title varchar(255),
description text,
created_at timestamp,
updated_at timestamp,
completed boolean
);
-- 7) define column id as the tables primary key
ALTER TABLE tasks
ADD PRIMARY KEY (id);

-- 8)
-- remove the column named completed
ALTER TABLE tasks
DROP completed;

-- add a column to tasks named completed_at:timestamp, that may be NULL, and has a default value of NULL.
ALTER TABLE tasks
ADD completed_at timestamp
DEFAULT NULL;

-- change the updated_at column to not allow NULL values,
ALTER TABLE tasks
ALTER COLUMN updated_at
SET NOT NULL;

-- created_at and updated_at have a default value of now()
ALTER TABLE tasks
ALTER COLUMN created_at
SET DEFAULT NOW();

ALTER TABLE tasks
ALTER COLUMN updated_at
SET DEFAULT NOW();

-- create a new task, by only setting values (not defining which columns) id = default value title = 'Study SQL' description = 'Complete this exercise' created_at = now() updated_at = now() completed_at = NULL
INSERT INTO tasks (title, description, created_at)
VALUES ('Study SQL', 'Complete this exercise', NOW());

-- create a new task title = 'Study PostgreSQL' description = 'Read all the documentation'
INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

-- select all the titles of tasks that are not yet completed
SELECT title
FROM tasks
WHERE completed_at IS NULL;

-- update the task with a title of 'Study SQL' to be completed as of now

UPDATE tasks
SET completed_at = NOW()
WHERE title = 'Study SQL';

-- select all titles and descriptions of tasks that are not yet completed
SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

-- select all fields of every task sorted by creation date in descending order
SELECT *
FROM tasks
ORDER BY created_at DESC;

-- create a new task title = 'mistake 1' description = 'a test entry'
INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

-- create a new task title = 'mistake 2' description = 'another test entry'

-- create a new task title = 'third mistake' description = 'another test entry'

-- select title fields of all tasks with a title that includes the word 'mistake'

-- delete the task that has a title of mistake 1

-- select title and description fields of all tasks with a title that includes the word 'mistake'

-- delete all tasks that includes the word 'mistake' in the title

-- select all fields of all tasks sorted by title in ascending order
