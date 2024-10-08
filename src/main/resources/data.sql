DROP TABLE IF EXISTS "USER";

CREATE TABLE "USER"
(
    ID           UUID DEFAULT RANDOM_UUID() NOT NULL,
    NAME         VARCHAR(100) NOT NULL,
    EMAIL        VARCHAR(120) NOT NULL,
    PASSWORD     VARCHAR(100) NOT NULL,
    IS_ACTIVE    SMALLINT NOT NULL DEFAULT 0,
    TOKEN        VARCHAR(250) NOT NULL,
    LAST_LOGIN   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CREATED_DATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_DATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (ID),
    UNIQUE (EMAIL)
);

DROP TABLE IF EXISTS PHONE;

CREATE TABLE PHONE
(
    ID           BIGINT AUTO_INCREMENT PRIMARY KEY,
    USER_ID      UUID NOT NULL,
    NUMBER       VARCHAR(15) NOT NULL,
    CITY_CODE    VARCHAR(6) NOT NULL,
    COUNTRY_CODE VARCHAR(6) NOT NULL,
    CREATED_DATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UPDATED_DATE TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (USER_ID) REFERENCES "USER" (ID)
);

INSERT INTO "USER" (ID, NAME, EMAIL, PASSWORD, IS_ACTIVE, TOKEN)
VALUES ('5cbc84a2-b90b-4139-97d3-9ea22c9797bc', 'Victor Puyo', 'victor.puyo@test.cl', '$2a$10$tMyYNESzn3nUCPmj7HDlTubUPGvARwsndZoJiEVjcmciU2rxNbJ.a',TRUE, 'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnZXJtYW5wdXlvQHRlc3QuY2wiLCJpYXQiOjE3MjgzNjc4NzIsImV4cCI6MTcyODM3MTQ3Mn0.1eWf0O8RckRJQhk0Y_cM8UQnUUPP5tqpHDA-U5oTLxg');

INSERT INTO PHONE (USER_ID, NUMBER, CITY_CODE, COUNTRY_CODE)
VALUES ('5cbc84a2-b90b-4139-97d3-9ea22c9797bc', '3217299734', '2', '57');