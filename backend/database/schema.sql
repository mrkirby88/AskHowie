BEGIN TRANSACTION;

DROP TABLE IF EXISTS responses_links;
DROP TABLE IF EXISTS links;
DROP TABLE IF EXISTS keywords;
DROP TABLE IF EXISTS responses;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE "responses" (
        r_id SERIAL PRIMARY KEY,
        title CHARACTER VARYING NOT NULL,
        description CHARACTER VARYING NOT NULL,
        img_text CHARACTER VARYING,
        img_url CHARACTER VARYING
);
        
CREATE TABLE "keywords" (
        keyword CHARACTER VARYING NOT NULL PRIMARY KEY,
        r_id INT NOT NULL,
        CONSTRAINT r_id FOREIGN KEY (r_id) REFERENCES responses (r_id)
);

CREATE TABLE "links" (
        l_id SERIAL NOT NULL PRIMARY KEY,
        name CHARACTER VARYING UNIQUE NOT NULL,
        txt CHARACTER VARYING NOT NULL,
        url CHARACTER VARYING NOT NULL
);

CREATE TABLE "responses_links" (
        r_id INT NOT NULL,
        l_id INT NOT NULL,
        CONSTRAINT l_id FOREIGN KEY (l_id) REFERENCES links (l_id),
        CONSTRAINT r_id FOREIGN KEY (r_id) REFERENCES responses (r_id),
        PRIMARY KEY (r_id, l_id)
        );

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('kenton','$2a$10$O412a/41UuKOjg0TWOb/geach7N3eTlvrsKffUK4L1HXOf1gw57DG', 'ROLE_USER');


COMMIT TRANSACTION;

INSERT INTO responses (title, description)
VALUES ('Pathway', 'What in pathway is troubling you?');
INSERT INTO keywords (keyword, r_id)
VALUES ('Pathway', (SELECT r_id FROM responses WHERE title = 'Pathway'));

INSERT INTO responses (title, description)
VALUES ('STAR', 'Our pathway program has some great tools for STAR answers');
INSERT INTO links (name, txt, url)
VALUES ('STAR', 'Link to STAR in Pathway','https://docs.google.com/document/d/1NvopfF2vG7LmivZSMYsJ3kwRg8t1WlwpvoSQ2anc9AI/edit');
INSERT INTO keywords (keyword, r_id)
VALUES ('star', (SELECT r_id FROM responses WHERE title = 'STAR'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'STAR'), (SELECT l_id FROM links WHERE name ILIKE 'star'));

INSERT INTO responses (title, description)
VALUES ('Cover Letter', 'Cover Letters are key to a good application');
INSERT INTO links (name, txt, url)
VALUES ('Cover Letter', 'Link to Cover Letters','https://lmgtfy.app/?q=cover+letter');
INSERT INTO keywords (keyword, r_id)
VALUES ('cover letter', (SELECT r_id FROM responses WHERE title = 'Cover Letter'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'Cover Letter'), (SELECT l_id FROM links WHERE name ILIKE 'cover letter'));

INSERT INTO responses (title, description)
VALUES ('Interview', 'Some tips for interviewing');
INSERT INTO links (name, txt, url)
VALUES ('Interview', 'Link to Interview Tips','https://lmgtfy.app/?q=interview+preparation+tips');
INSERT INTO keywords (keyword, r_id)
VALUES ('Interview', (SELECT r_id FROM responses WHERE title = 'Interview'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'Interview'), (SELECT l_id FROM links WHERE name ILIKE 'Interview'));

INSERT INTO responses (title, description)
VALUES ('LinkedIn', 'Resources for LinkedIn');
INSERT INTO links (name, txt, url)
VALUES ('LinkedIn', 'LinkedIn Tips','https://drive.google.com/file/d/18MmZpnI96BBriUVO3dHT2-YhVzKCJyJt/view');
INSERT INTO keywords (keyword, r_id)
VALUES ('LinkedIn', (SELECT r_id FROM responses WHERE title = 'LinkedIn'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'LinkedIn'), (SELECT l_id FROM links WHERE name ILIKE 'LinkedIn'));

INSERT INTO responses (title, description, img_text, img_url)
VALUES ('Dress', 'Tips on how to dress for interview', 'Infographic on how to dress', 'https://previews.dropbox.com/p/thumb/ABZY3bN7C4_YnJWeczO8f2MuxYSEb33A56NgxMU2V-LAKrQjmIAZRJB3IYyndnoKJmyt_WizvdHsX-nbMm_nqBMsvM65MPynxLdKIimGHN5qoDD11JX3uOSLXfAlNNNiD4IrDn4ZTE_1v6vVYz_BcrusrCZsipN7Igqr9eRHMHc5FzfSenNA5ubK8OOgcGhaHnO92pVLj3nnDU4HHnkVpp7wPbgTMzuzKJRVLEOJzJFdQ5-VYPoiEclKzNpGtvKvXBkCbBYtCs2BUieLiXE5klPFEF7QclFdaO_MJSdGY0KRPKzN2EBZh7ECHdSOqZD1O9qkQbTnBH9El79TG9Y6RZw7Iou0WzTLfbVA2H0YHBzSNQ/p.jpeg');
INSERT INTO links (name, txt, url)
VALUES ('Dress', 'Dress Tips','https://drive.google.com/file/d/1bYvVX99x7g-t3ii0fiUiKUH2VlDYJARw/view?usp=sharing');
INSERT INTO keywords (keyword, r_id)
VALUES ('Dress', (SELECT r_id FROM responses WHERE title = 'Dress'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'Dress'), (SELECT l_id FROM links WHERE name ILIKE 'Dress'));

INSERT INTO responses (title, description)
VALUES ('array', ' special data type found in almost all programming languages. They make it more convenient to work with values in aggregate rather than a series of individual variables.');
INSERT INTO links (name, txt, url)
VALUES ('java_array', 'Link to what is an array for Java','https://v2-4-techelevator-book.netlify.app/content/arrays-and-loops-ool.html#arrays');
INSERT INTO links (name, txt, url)
VALUES ('C#_array', 'Link to what is an array for C#','https://v2-4-techelevator-book.netlify.app/content/arrays-and-loops-ool.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('java_array', (SELECT r_id FROM responses WHERE title = 'array'));
INSERT INTO keywords (keyword, r_id)
VALUES ('C#_array', (SELECT r_id FROM responses WHERE title = 'array'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'array'), (SELECT l_id FROM links WHERE name ILIKE 'java_array'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'array'), (SELECT l_id FROM links WHERE name ILIKE 'C#_array'));




-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER final_capstone_owner
WITH PASSWORD 'finalcapstone';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO final_capstone_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_owner;

CREATE USER final_capstone_appuser
WITH PASSWORD 'finalcapstone';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO final_capstone_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO final_capstone_appuser;
