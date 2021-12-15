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

INSERT INTO responses (title, description)
VALUES ('loops', ' a software program or script that repeats the same instructions or processes the same information over and over until receiving the order to stop.');
INSERT INTO links (name, txt, url)
VALUES ('loops', 'Link to loops in book', 'https://v2-4-techelevator-book.netlify.app/content/arrays-and-loops-ool.html#loops');
INSERT INTO keywords (keyword, r_id)
VALUES ('loops', (SELECT r_id FROM responses WHERE title = 'loops'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'loops'), (SELECT l_id FROM links WHERE name ILIKE 'loops'));

INSERT INTO responses (title, description)
VALUES ('classes', 'An extensible program-code-template for creating objects.');
INSERT INTO links (name, txt, url)
VALUES ('classes','link to classes in book', 'https://v2-4-techelevator-book.netlify.app/content/classes-encapsulation-ool.html#classes');
INSERT INTO keywords (keyword, r_id)
VALUES ('classes', (SELECT r_id FROM responses WHERE title = 'classes'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'classes'), (SELECT l_id FROM links WHERE name ILIKE 'classes'));

INSERT INTO responses (title, description)
VALUES ('inheritance', 'The procedure in which one class inherits the attributes and methods of another class.');
INSERT INTO links (name, txt, url)
VALUES ('inheritance','link to inheritance in book', 'https://v2-4-techelevator-book.netlify.app/content/inheritance-ool.html#class-hierarchies');
INSERT INTO keywords (keyword, r_id)
VALUES ('inheritance', (SELECT r_id FROM responses WHERE title = 'inheritance'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'inheritance'), (SELECT l_id FROM links WHERE name ILIKE 'inheritance'));

INSERT INTO responses (title, description)
VALUES ('polymorphism', 'The provision of a single interface to entities of different types, or the use of a single symbol to represent multiple different types.');
INSERT INTO links (name, txt, url)
VALUES ('polymorphism','link to polymorphism in book', 'https://v2-4-techelevator-book.netlify.app/content/polymorphism-ool.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('polymorphism', (SELECT r_id FROM responses WHERE title = 'polymorphism'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'polymorphism'), (SELECT l_id FROM links WHERE name ILIKE 'polymorphism'));

INSERT INTO responses (title, description)
VALUES ('HTML', '(Hypertext Markup Language) is the code that is used to structure a web page and its content.');
INSERT INTO links (name, txt, url)
VALUES ('HTML','link to HTML in book', 'https://v2-4-techelevator-book.netlify.app/content/intro-html-css.html#introduction-to-html');
INSERT INTO keywords (keyword, r_id)
VALUES ('HTML', (SELECT r_id FROM responses WHERE title = 'HTML'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'HTML'), (SELECT l_id FROM links WHERE name ILIKE 'HTML'));

INSERT INTO responses (title, description)
VALUES ('CSS', '(Cascading Style Sheets) is a language for styling the webpage.');
INSERT INTO links (name, txt, url)
VALUES ('CSS','link to CSS in book', 'https://v2-4-techelevator-book.netlify.app/content/intro-html-css.html#introduction-to-css');
INSERT INTO keywords (keyword, r_id)
VALUES ('CSS', (SELECT r_id FROM responses WHERE title = 'CSS'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'CSS'), (SELECT l_id FROM links WHERE name ILIKE 'CSS'));

INSERT INTO responses (title, description)
VALUES ('JavaScript', 'Text-based programming language used both on the client-side and server-side that allows you to make web pages interactive.');
INSERT INTO links (name, txt, url)
VALUES ('JavaScript','link to JavaScript in book', 'https://v2-4-techelevator-book.netlify.app/content/intro-to-javascript.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('JavaScript', (SELECT r_id FROM responses WHERE title = 'JavaScript'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'JavaScript'), (SELECT l_id FROM links WHERE name ILIKE 'JavaScript'));

INSERT INTO responses (title, description)
VALUES ('functions', 'A block of code designed to perform a particular task.');
INSERT INTO links (name, txt, url)
VALUES ('functions','link to functions in book', 'https://v2-4-techelevator-book.netlify.app/content/functions-javascript.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('functions', (SELECT r_id FROM responses WHERE title = 'functions'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'functions'), (SELECT l_id FROM links WHERE name ILIKE 'functions'));

INSERT INTO responses (title, description)
VALUES ('event handling', 'An event handler is a routine that deals with the event, allowing a programmer to write code that is executed when the event occurs.');
INSERT INTO links (name, txt, url)
VALUES ('event handling','link to event handling in book', 'https://v2-4-techelevator-book.netlify.app/content/event-handling-javascript.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('event handling', (SELECT r_id FROM responses WHERE title = 'event handling'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'event handling'), (SELECT l_id FROM links WHERE name ILIKE 'event handling'));

INSERT INTO responses (title, description)
VALUES ('vue', 'an open-source model–view–viewmodel front end JavaScript framework for building user interfaces and single-page applications.');
INSERT INTO links (name, txt, url)
VALUES ('vue','link to vue in book', 'https://v2-4-techelevator-book.netlify.app/content/intro-to-vue-and-data-binding.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('vue', (SELECT r_id FROM responses WHERE title = 'vue'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'vue'), (SELECT l_id FROM links WHERE name ILIKE 'vue'));

INSERT INTO responses (title, description)
VALUES ('router', 'Helps link between the browsers URL/History and Vues components allowing for certain paths to render whatever view is associated with it.');
INSERT INTO links (name, txt, url)
VALUES ('router','link to router in book', 'https://v2-4-techelevator-book.netlify.app/content/vue-router.html#getting-started-with-vue-router');
INSERT INTO keywords (keyword, r_id)
VALUES ('router', (SELECT r_id FROM responses WHERE title = 'router'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'router'), (SELECT l_id FROM links WHERE name ILIKE 'router'));

INSERT INTO responses (title, description)
VALUES ('sql', '(structured query language) Is a language for specifying the organization of databases.');
INSERT INTO links (name, txt, url)
VALUES ('sql','link to sql in book', 'https://v2-4-techelevator-book.netlify.app/content/introduction-to-SQL.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('sql', (SELECT r_id FROM responses WHERE title = 'sql'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'sql'), (SELECT l_id FROM links WHERE name ILIKE 'sql'));

INSERT INTO responses (title, description)
VALUES ('joins', 'Used to combine data or rows from two or more tables based on a common field between them.');
INSERT INTO links (name, txt, url)
VALUES ('joins','link to sql joins in book', 'https://v2-4-techelevator-book.netlify.app/content/sql-joins.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('joins', (SELECT r_id FROM responses WHERE title = 'joins'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'joins'), (SELECT l_id FROM links WHERE name ILIKE 'joins'));

INSERT INTO responses (title, description)
VALUES ('insert', 'The INSERT INTO statement is used to insert new records in a table.');
INSERT INTO links (name, txt, url)
VALUES ('insert','link to inserting in book', 'https://v2-4-techelevator-book.netlify.app/content/inserts-updates-deletes.html#inserting-new-rows');
INSERT INTO keywords (keyword, r_id)
VALUES ('insert', (SELECT r_id FROM responses WHERE title = 'insert'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'insert'), (SELECT l_id FROM links WHERE name ILIKE 'insert'));

INSERT INTO responses (title, description)
VALUES ('updating', 'The UPDATE statement is used to modify the existing records in a table.');
INSERT INTO links (name, txt, url)
VALUES ('updating','link to updating in book', 'https://v2-4-techelevator-book.netlify.app/content/inserts-updates-deletes.html#updating-existing-rows');
INSERT INTO keywords (keyword, r_id)
VALUES ('updating', (SELECT r_id FROM responses WHERE title = 'updating'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'updating'), (SELECT l_id FROM links WHERE name ILIKE 'updating'));

INSERT INTO responses (title, description)
VALUES ('deleting', 'The DELETE statement is used to delete existing records in a table.');
INSERT INTO links (name, txt, url)
VALUES ('deleting','link to deleting in book', 'https://v2-4-techelevator-book.netlify.app/content/inserts-updates-deletes.html#deleting-rows');
INSERT INTO keywords (keyword, r_id)
VALUES ('deleting', (SELECT r_id FROM responses WHERE title = 'deleting'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'deleting'), (SELECT l_id FROM links WHERE name ILIKE 'deleting'));

INSERT INTO responses (title, description)
VALUES ('relational', 'A type of database that stores and provides access to data points that are related to one another.');
INSERT INTO links (name, txt, url)
VALUES ('relational','link to realtional database design in book', 'https://v2-4-techelevator-book.netlify.app/content/relational-database-design.html#building-a-sample-application-tach-escalator');
INSERT INTO keywords (keyword, r_id)
VALUES ('relational', (SELECT r_id FROM responses WHERE title = 'relational'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'relational'), (SELECT l_id FROM links WHERE name ILIKE 'relational'));

INSERT INTO responses (title, description)
VALUES ('dao', 'An object-based data access interface that provides access to SQL data sources through VBA.');
INSERT INTO links (name, txt, url)
VALUES ('dao','link to DAO pattern in book', 'https://v2-4-techelevator-book.netlify.app/content/dao-pattern.html');
INSERT INTO keywords (keyword, r_id)
VALUES ('dao', (SELECT r_id FROM responses WHERE title = 'dao'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'dao'), (SELECT l_id FROM links WHERE name ILIKE 'dao'));

INSERT INTO responses (title, description)
VALUES ('git', 'Git is a version control system for tracking changes in computer files and coordinating work on those files among multiple people. Developers primarily use Git for source code management in software development. You can also use it to keep track of changes in any set of files.');
INSERT INTO links (name, txt, url)
VALUES ('git', 'link to version control with Git', 'https://v2-4-techelevator-book.netlify.app/content/introduction-to-tools.html#version-control-with-git');
INSERT INTO keywords (keyword, r_id)
VALUES ('git', (SELECT r_id FROM responses WHERE title = 'git'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'git'), (SELECT l_id FROM links WHERE name ILIKE 'git'));

INSERT INTO responses (title, description)
VALUES ('tech event', 'PA Tech Events hosted by Eventbrite:');
INSERT INTO links (name, txt, url)
VALUES ('tech event', 'Link to Eventbrite with PA Tech events', 'https://www.eventbrite.com/d/pa--pittsburgh/tech-events/');
INSERT INTO keywords (keyword, r_id)
VALUES ('tech event', (SELECT r_id FROM responses WHERE title = 'tech event'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'tech event'), (SELECT l_id FROM links WHERE name ILIKE 'tech event'));

INSERT INTO responses (title, description)
VALUES ('jobs', 'PGH Career Connector:');
INSERT INTO links (name, txt, url)
VALUES ('jobs', 'Link to PGH Career Connector', 'https://www.pghcareerconnector.com/jobs/');
INSERT INTO keywords (keyword, r_id)
VALUES ('jobs', (SELECT r_id FROM responses WHERE title = 'jobs'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'jobs'), (SELECT l_id FROM links WHERE name ILIKE 'jobs'));

INSERT INTO responses (title, description, img_text, img_url)
VALUES ('snek', 'Snek!', 'Picture of snek', 'https://files.slack.com/files-pri/T0GNFLF6D-F02QZ06UUEQ/img_20210910_131830.jpg');
INSERT INTO links (name, txt, url)
VALUES ('snek', 'Picture of Snek', 'https://files.slack.com/files-pri/T0GNFLF6D-F02QZ06UUEQ/img_20210910_131830.jpg');
INSERT INTO keywords (keyword, r_id)
VALUES ('snek', (SELECT r_id FROM responses WHERE title = 'snek'));
INSERT INTO responses_links (r_id, l_id)
VALUES ((SELECT r_id FROM responses WHERE title = 'snek'), (SELECT l_id FROM links WHERE name ILIKE 'snek'));

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
