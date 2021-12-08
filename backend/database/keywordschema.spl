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

SELECT * FROM responses WHERE title = 'LinkedIn';