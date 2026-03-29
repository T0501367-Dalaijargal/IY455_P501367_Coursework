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

INSERT INTO RENTAL_CATEGORY (Rental_Category, Rental_Cost) VALUES
    ('Action', 4.00),
    ('Adventure', 3.50),
    ('Animation', 3.50),
    ('Biography', 3.80),
    ('Comedy', 4.50),
    ('Crime', 3.80),
    ('Drama', 4.20),
    ('Horror', 4.00),
    ('Mystery', 3.80),
    ('Romance', 4.50),
    ('Sci-Fi', 4.50),
    ('Superhero', 4.50),
    ('Thriller', 4.50);

INSERT INTO BORROWER (Borrower_No, Borrower_Name, Borrower_Address, Borrower_Status) VALUES
    ('BN1721', 'Ben Jones', '28 Low Road, Nottingham NG5 3PB', 'Allowed'),
    ('BN2034', 'Sarah Williams', '15 Oak Avenue, Derby DE1 2QR', 'Allowed'),
    ('BN3156', 'James Carter', '42 High Street, Leicester LE1 5DR', 'Allowed'),
    ('BN4289', 'Emma Thompson', '7 Castle Lane, Nottingham NG1 6AA', 'Suspended'),
    ('BN5012', 'Michael Brown', '91 Park Road, Derby DE22 1GB', 'Allowed'),
    ('BN6378', 'Lucy Davis', '33 Queen Street, Leicester LE2 7HN', 'Allowed'),
    ('BN7491', 'David Wilson', '56 Church Road, Nottingham NG7 2RD', 'Allowed'),
    ('BN8654', 'Rachel Green', '12 Mill Lane, Derby DE3 4PQ', 'Allowed'),
    ('BN9102', 'Thomas Harris', '68 Bridge Street, Leicester LE3 5AB', 'Suspended'),
    ('BN1045', 'Olivia Martin', '24 Station Road, Nottingham NG2 3EF', 'Allowed');