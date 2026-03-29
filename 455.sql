CREATE DATABASE IF NOT EXISTS dvd_rental_db;
USE dvd_rental_db;

DROP TABLE IF EXISTS LOAN_COPY;
DROP TABLE IF EXISTS LOAN;
DROP TABLE IF EXISTS COPY;
DROP TABLE IF EXISTS DVD;
DROP TABLE IF EXISTS RENTAL_CATEGORY;
DROP TABLE IF EXISTS BORROWER;

CREATE TABLE BORROWER (
    Borrower_No      VARCHAR(10)   NOT NULL,
    Borrower_Name    VARCHAR(50)   NOT NULL,
    Borrower_Address VARCHAR(100)  NOT NULL,
    Borrower_Status  VARCHAR(20)   NOT NULL DEFAULT 'Allowed',
    PRIMARY KEY (Borrower_No)
);

CREATE TABLE RENTAL_CATEGORY (
    Rental_Category  VARCHAR(20)   NOT NULL,
    Rental_Cost      DECIMAL(4,2)  NOT NULL,
    PRIMARY KEY (Rental_Category)
);

CREATE TABLE DVD (
    DVD_No             VARCHAR(10)   NOT NULL,
    DVD_Title          VARCHAR(100)  NOT NULL,
    DVD_Starring_Actor VARCHAR(50)   NOT NULL,
    DVD_Year           INT           NOT NULL,
    Rental_Category    VARCHAR(20)   NOT NULL,
    PRIMARY KEY (DVD_No),
    FOREIGN KEY (Rental_Category) REFERENCES RENTAL_CATEGORY(Rental_Category)
);

CREATE TABLE COPY (
    Copy_No          VARCHAR(10)   NOT NULL,
    DVD_No           VARCHAR(10)   NOT NULL,
    Shelf_Position   VARCHAR(10)   NOT NULL,
    PRIMARY KEY (Copy_No),
    FOREIGN KEY (DVD_No) REFERENCES DVD(DVD_No)
);

CREATE TABLE LOAN (
    Loan_No          VARCHAR(10)   NOT NULL,
    Borrower_No      VARCHAR(10)   NOT NULL,
    Loan_Date        DATE          NOT NULL,
    PRIMARY KEY (Loan_No),
    FOREIGN KEY (Borrower_No) REFERENCES BORROWER(Borrower_No)
);

CREATE TABLE LOAN_COPY (
    Loan_No          VARCHAR(10)   NOT NULL,
    Copy_No          VARCHAR(10)   NOT NULL,
    DVD_Status       VARCHAR(20)   NOT NULL DEFAULT 'On Loan',
    Return_Due_Date  DATE          NOT NULL,
    PRIMARY KEY (Loan_No, Copy_No),
    FOREIGN KEY (Loan_No) REFERENCES LOAN(Loan_No),
    FOREIGN KEY (Copy_No) REFERENCES COPY(Copy_No)
);
