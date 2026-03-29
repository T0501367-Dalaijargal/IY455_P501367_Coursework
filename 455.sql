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

INSERT INTO DVD (DVD_No, DVD_Title, DVD_Starring_Actor, DVD_Year, Rental_Category) VALUES
    ('DN050', 'Guardians of the Galaxy', 'Chris Pratt', 2014, 'Superhero'),
    ('DN0135', 'Prometheus', 'Noomi Rapace', 2012, 'Adventure'),
    ('DN0171', 'Split', 'James McAvoy', 2016, 'Horror'),
    ('DN0102', 'Sing', 'Matthew McConaughey', 2016, 'Animation'),
    ('DN0188', 'Suicide Squad', 'Will Smith', 2016, 'Superhero'),
    ('DN025', 'The Great Wall', 'Matt Damon', 2016, 'Action'),
    ('DN0157', 'La La Land', 'Ryan Gosling', 2016, 'Comedy'),
    ('DN0177', 'Mindhorn', 'Essie Davis', 2016, 'Comedy'),
    ('DN0129', 'The Lost City of Z', 'Charlie Hunnam', 2016, 'Action'),
    ('DN0114', 'Passengers', 'Jennifer Lawrence', 2016, 'Adventure'),
    ('DN085', 'Fantastic Beasts and Where to Find Them', 'Eddie Redmayne', 2016, 'Adventure'),
    ('DN083', 'Hidden Figures', 'Taraji P. Henson', 2016, 'Biography'),
    ('DN039', 'Rogue One', 'Felicity Jones', 2016, 'Action'),
    ('DN0117', 'Moana', 'Auli''i Cravalho', 2016, 'Animation'),
    ('DN0183', 'Colossal', 'Anne Hathaway', 2016, 'Action'),
    ('DN100', 'The Secret Life of Pets', 'Louis C.K.', 2016, 'Animation'),
    ('DN070', 'Hacksaw Ridge', 'Andrew Garfield', 2016, 'Biography'),
    ('DN048', 'Jason Bourne', 'Matt Damon', 2016, 'Action'),
    ('DN0146', 'Lion', 'Dev Patel', 2016, 'Biography'),
    ('DN062', 'Arrival', 'Amy Adams', 2016, 'Drama'),
    ('DN0139', 'Gold', 'Matthew McConaughey', 2016, 'Adventure'),
    ('DN0151', 'Manchester by the Sea', 'Casey Affleck', 2016, 'Drama'),
    ('DN056', 'Hounds of Love', 'Emma Booth', 2016, 'Crime'),
    ('DN0156', 'Trolls', 'Anna Kendrick', 2016, 'Animation'),
    ('DN0166', 'Independence Day: Resurgence', 'Liam Hemsworth', 2016, 'Action'),
    ('DN033', 'Paris pieds nus', 'Fiona Gordon', 2016, 'Comedy'),
    ('DN0108', 'Bahubali: The Beginning', 'Prabhas', 2015, 'Action'),
    ('DN052', 'Dead Awake', 'Jocelin Donahue', 2016, 'Horror'),
    ('DN0159', 'Bad Moms', 'Mila Kunis', 2016, 'Comedy'),
    ('DN0167', 'Assassin''s Creed', 'Michael Fassbender', 2016, 'Action'),
    ('DN0161', 'Why Him?', 'Zoey Deutch', 2016, 'Comedy'),
    ('DN013', 'Nocturnal Animals', 'Amy Adams', 2016, 'Drama'),
    ('DN0149', 'X-Men: Apocalypse', 'James McAvoy', 2016, 'Superhero'),
    ('DN087', 'Deadpool', 'Ryan Reynolds', 2016, 'Superhero'),
    ('DN0190', 'Resident Evil: The Final Chapter', 'Milla Jovovich', 2016, 'Action'),
    ('DN0107', 'Captain America: Civil War', 'Chris Evans', 2016, 'Superhero'),
    ('DN0127', 'Interstellar', 'Matthew McConaughey', 2014, 'Adventure'),
    ('DN0109', 'Doctor Strange', 'Benedict Cumberbatch', 2016, 'Superhero'),
    ('DN0152', 'The Magnificent Seven', 'Denzel Washington', 2016, 'Action'),
    ('DN015', '5/25/1977', 'John Francis Daley', 2007, 'Comedy'),
    ('DN089', 'Sausage Party', 'Seth Rogen', 2016, 'Animation'),
    ('DN072', 'Moonlight', 'Mahershala Ali', 2016, 'Drama'),
    ('DN019', 'Don''t Die in the Woods', 'Brittany Blanton', 2016, 'Horror'),
    ('DN032', 'The Founder', 'Michael Keaton', 2016, 'Biography'),
    ('DN0123', 'Lowriders', 'Gabriel Chavarria', 2016, 'Drama'),
    ('DN003', 'Pirates of the Caribbean: On Stranger Tides', 'Johnny Depp', 2011, 'Action'),
    ('DN029', 'Miss Sloane', 'Jessica Chastain', 2016, 'Drama'),
    ('DN0158', 'Fallen', 'Hermione Corfield', 2016, 'Adventure'),
    ('DN011', 'Star Trek Beyond', 'Chris Pine', 2016, 'Action'),
    ('DN040', 'The Last Face', 'Charlize Theron', 2016, 'Drama');