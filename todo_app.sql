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

-- 6)
CREATE TABLE tasks


-- DROP DATABASE todo_app
-- DELETE FROM users USING producers
-- WHERE producer_id = producers.id AND producers.name = 'michael';
