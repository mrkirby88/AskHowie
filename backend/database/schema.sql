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
        r_id INT NOT NULL PRIMARY KEY,
        l_id INT NOT NULL,
        CONSTRAINT l_id FOREIGN KEY (l_id) REFERENCES links (l_id),
        CONSTRAINT r_id FOREIGN KEY (r_id) REFERENCES responses (r_id) 
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


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

