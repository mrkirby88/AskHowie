DROP TABLE IF EXISTS keywords;
DROP TABLE IF EXISTS responses;

CREATE TABLE "responses"
(
        id SERIAL PRIMARY KEY,
        title CHARACTER VARYING NOT NULL,
        answer CHARACTER VARYING NOT NULL
);
        
        

CREATE TABLE "keywords"
(
        keywordID INT NOT NULL,
        keyword CHARACTER VARYING NOT NULL,
        CONSTRAINT fk_id FOREIGN KEY (keywordID) REFERENCES responses (id)
);

INSERT INTO responses (title, answer)
VALUES ('pathway', 'What in pathway is troubling you?');

INSERT INTO keywords (keyword, keywordID)
VALUES ('pathway', (SELECT id FROM responses WHERE title = 'pathway'));

INSERT INTO responses (title, answer)
VALUES ('cover letter', 'Let me google that for you <a target="_blank" href="https://lmgtfy.app/?q=cover+letter">');

INSERT INTO keywords (keyword, keywordID)
VALUES ('cover letter', (SELECT id FROM responses WHERE title = 'cover letter'));

INSERT INTO responses (title, answer)
VALUES ('interview', 'Let me google that for you <a target="_blank" href="https://lmgtfy.app/?q=interview+preparation+tips">');

INSERT INTO responses (title, answer)
VALUES ('STAR', 'Our pathway program has some great tools for STAR answers here <a target= "_blank" href= "https://docs.google.com/document/d/1NvopfF2vG7LmivZSMYsJ3kwRg8t1WlwpvoSQ2anc9AI/edit">');

INSERT INTO keywords (keyword, keywordID)
VALUES ('STAR', (SELECT id FROM responses WHERE title = 'STAR'));

INSERT INTO responses (title, answer)
VALUES ('LinkedIn', 'There are multiple things you can do to your LinkedIn to stand out, here are a few! <a target= "_blank" href= "https://drive.google.com/file/d/18MmZpnI96BBriUVO3dHT2-YhVzKCJyJt/view">, <a target= "_blank" href= "https://drive.google.com/file/d/1QSTFITKCvAPEOD5ha4yY3IyYtRkdLU11/view">, <a target= "_blank" href= "https://lmgtfy.app/?q=linkedin+profile+tips">, <a target= "_blank" href= "https://docs.google.com/document/d/173vlHCZd8QRnoDvx7szfGxVrXVcTdgoIpMva7pejbE0/edit">'
                        );
                        
INSERT INTO keywords (keyword, keywordID)
VALUES ('LinkedIn', (SELECT id FROM responses WHERE title = 'LinkedIn'));

INSERT INTO responses (title, answer)
VALUES ('Interview Attire', 'Here is an example of proper attire for interviews <a target = "_blank" href= "https://drive.google.com/file/d/1bYvVX99x7g-t3ii0fiUiKUH2VlDYJARw/view?usp=sharing">');
INSERT INTO keywords (keyword, keywordID)
VALUES ('Interview Attire', (SELECT id FROM responses WHERE title = 'Interview Attire'));
INSERT INTO keywords (keyword, keywordID)
VALUES ('Should I Dress', (SELECT id FROM responses WHERE title = 'Interview Attire'));
INSERT INTO keywords (keyword, keywordID)
VALUES ('How To Dress', (SELECT id FROM responses WHERE title = 'Interview Attire'));

INSERT INTO responses (title, answer)
VALUES ('array', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/arrays-and-loops-ool.html#arrays"> This chapter in the student book is helpful</a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('array', (SELECT id FROM responses WHERE title = 'array'));

INSERT INTO responses (title, answer)
VALUES ('mvc', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/relational-database-design.html"> Here is a good place to start</a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('mvc', (SELECT id FROM responses WHERE title = 'mvc'));

INSERT INTO responses (title, answer)
VALUES ('sql', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/introduction-to-SQL.html#relational-database-management-systems"> Starting here in the book is a good idea </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('sql', (SELECT id FROM responses WHERE title = 'sql'));

INSERT INTO responses (title, answer)
VALUES ('loops', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/arrays-and-loops-ool.html#loops"> Basic info on loops can be found here </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('loops', (SELECT id FROM responses WHERE title = 'loops'));

INSERT INTO responses (title, answer)
VALUES ('classes', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/classes-encapsulation-ool.html#classes"> Info on classes and encapsulation in student book </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('classes', (SELECT id FROM responses WHERE title = 'classes'));
INSERT INTO keywords (keyword, keywordID)
VALUES ('encapsulation', (SELECT id FROM responses WHERE title = 'classes'));

INSERT INTO responses (title, answer)
VALUES ('inheritance', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/inheritance-ool.html#class-hierarchies"> explanation of inheritance </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('inheritance', (SELECT id FROM responses WHERE title = 'inheritance'));

INSERT INTO responses (title, answer)
VALUES ('polymorphism', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/polymorphism-ool.html"> explanation of polymorphism </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('polymorphism', (SELECT id FROM responses WHERE title = 'polymorphism'));

INSERT INTO responses (title, answer)
VALUES ('HTML', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/intro-html-css.html#introduction-to-html"> Intro to HTML </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('HTML', (SELECT id FROM responses WHERE title = 'HTML'));

INSERT INTO responses (title, answer)
VALUES ('CSS', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/intro-html-css.html#introduction-to-css"> Intro to CSS </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('CSS', (SELECT id FROM responses WHERE title = 'CSS'));

INSERT INTO responses (title, answer)
VALUES ('Vue', '<a target = "_blank" href = "https://v2-4-techelevator-book.netlify.app/content/intro-to-vue-and-data-binding.html#vanilla-javascript"> Intro to Vue </a>');
INSERT INTO keywords (keyword, keywordID)
VALUES ('Vue', (SELECT id FROM responses WHERE title = 'Vue'));
INSERT INTO keywords (keyword, keywordID)
VALUES ('Vue.js', (SELECT id FROM responses WHERE title = 'Vue'));

