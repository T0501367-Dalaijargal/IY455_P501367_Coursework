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
    ('DN040', 'The Last Face', 'Charlize Theron', 2016, 'Drama'),
    ('DN0132', 'Star Wars: Episode VII - The Force Awakens', 'Daisy Ridley', 2015, 'Action'),
    ('DN0196', 'Underworld: Blood Wars', 'Kate Beckinsale', 2016, 'Action'),
    ('DN095', 'Mother''s Day', 'Jennifer Aniston', 2016, 'Comedy'),
    ('DN0140', 'John Wick', 'Keanu Reeves', 2014, 'Action'),
    ('DN073', 'The Dark Knight', 'Christian Bale', 2008, 'Superhero'),
    ('DN0187', 'Silence', 'Andrew Garfield', 2016, 'Adventure'),
    ('DN0186', 'Don''t Breathe', 'Stephen Lang', 2016, 'Crime'),
    ('DN0200', 'Me Before You', 'Emilia Clarke', 2016, 'Drama'),
    ('DN046', 'Their Finest', 'Gemma Arterton', 2016, 'Comedy'),
    ('DN090', 'Sully', 'Tom Hanks', 2016, 'Biography'),
    ('DN0142', 'Batman v Superman: Dawn of Justice', 'Ben Affleck', 2016, 'Superhero'),
    ('DN092', 'The Autopsy of Jane Doe', 'Brian Cox', 2016, 'Horror'),
    ('DN0155', 'The Girl on the Train', 'Emily Blunt', 2016, 'Crime'),
    ('DN0150', 'Fifty Shades of Grey', 'Dakota Johnson', 2015, 'Drama'),
    ('DN001', 'The Prestige', 'Christian Bale', 2006, 'Drama'),
    ('DN0103', 'Kingsman: The Secret Service', 'Colin Firth', 2014, 'Action'),
    ('DN078', 'Patriots Day', 'Mark Wahlberg', 2016, 'Drama'),
    ('DN068', 'Mad Max: Fury Road', 'Tom Hardy', 2015, 'Action'),
    ('DN0192', 'Wakefield', 'Bryan Cranston', 2016, 'Drama'),
    ('DN042', 'Deepwater Horizon', 'Mark Wahlberg', 2016, 'Action'),
    ('DN049', 'The Promise', 'Oscar Isaac', 2016, 'Drama'),
    ('DN0111', 'Allied', 'Brad Pitt', 2016, 'Action'),
    ('DN0144', 'A Monster Calls', 'Lewis MacDougall', 2016, 'Drama'),
    ('DN0112', 'Collateral Beauty', 'Will Smith', 2016, 'Drama'),
    ('DN006', 'Zootopia', 'Ginnifer Goodwin', 2016, 'Animation'),
    ('DN060', 'Pirates of the Caribbean: At World''s End', 'Johnny Depp', 2007, 'Action'),
    ('DN0116', 'The Avengers', 'Robert Downey Jr.', 2012, 'Superhero'),
    ('DN0128', 'Inglourious Basterds', 'Brad Pitt', 2009, 'Adventure'),
    ('DN0194', 'Pirates of the Caribbean: Dead Man''s Chest', 'Johnny Depp', 2006, 'Action'),
    ('DN0181', 'Ghostbusters', 'Melissa McCarthy', 2016, 'Action'),
    ('DN0118', 'Inception', 'Leonardo DiCaprio', 2010, 'Action'),
    ('DN014', 'Captain Fantastic', 'Viggo Mortensen', 2016, 'Comedy'),
    ('DN0175', 'The Wolf of Wall Street', 'Leonardo DiCaprio', 2013, 'Biography'),
    ('DN061', 'Gone Girl', 'Ben Affleck', 2014, 'Crime'),
    ('DN053', 'Furious Seven', 'Vin Diesel', 2015, 'Action'),
    ('DN065', 'Jurassic World', 'Chris Pratt', 2015, 'Action'),
    ('DN0164', 'Live by Night', 'Ben Affleck', 2016, 'Crime'),
    ('DN0115', 'Avatar', 'Sam Worthington', 2009, 'Action'),
    ('DN0143', 'The Hateful Eight', 'Samuel L. Jackson', 2015, 'Crime'),
    ('DN041', 'The Accountant', 'Ben Affleck', 2016, 'Action'),
    ('DN0101', 'Prisoners', 'Hugh Jackman', 2013, 'Crime'),
    ('DN0138', 'Warcraft', 'Travis Fimmel', 2016, 'Action'),
    ('DN0141', 'The Help', 'Emma Stone', 2011, 'Drama'),
    ('DN0197', 'War Dogs', 'Jonah Hill', 2016, 'Comedy'),
    ('DN0179', 'Avengers: Age of Ultron', 'Robert Downey Jr.', 2015, 'Superhero'),
    ('DN0120', 'The Nice Guys', 'Russell Crowe', 2016, 'Action'),
    ('DN0198', 'Kimi no na wa', 'RyÃÂ»nosuke Kamiki', 2016, 'Animation'),
    ('DN038', 'The Void', 'Aaron Poole', 2016, 'Horror'),
    ('DN051', 'Personal Shopper', 'Kristen Stewart', 2016, 'Drama'),
    ('DN082', 'The Departed', 'Leonardo DiCaprio', 2006, 'Crime'),
    ('DN0126', 'Legend', 'Tom Hardy', 2015, 'Biography'),
    ('DN0125', 'Thor', 'Chris Hemsworth', 2011, 'Superhero'),
    ('DN0163', 'The Martian', 'Matt Damon', 2015, 'Adventure'),
    ('DN012', 'Contratiempo', 'Mario Casas', 2016, 'Crime'),
    ('DN0180', 'The Man from U.N.C.L.E.', 'Henry Cavill', 2015, 'Action'),
    ('DN037', 'Hell or High Water', 'Chris Pine', 2016, 'Crime'),
    ('DN0145', 'The Comedian', 'Robert De Niro', 2016, 'Comedy'),
    ('DN026', 'The Legend of Tarzan', 'Alexander SkarsgÃÂ¥rd', 2016, 'Action'),
    ('DN074', 'All We Had', 'Eve Lindley', 2016, 'Drama'),
    ('DN064', 'Ex Machina', 'Alicia Vikander', 2014, 'Drama'),
    ('DN088', 'The Belko Experiment', 'John Gallagher Jr.', 2016, 'Action'),
    ('DN0174', '12 Years a Slave', 'Chiwetel Ejiofor', 2013, 'Biography'),
    ('DN080', 'The Bad Batch', 'Keanu Reeves', 2016, 'Romance'),
    ('DN0154', '300', 'Gerard Butler', 2006, 'Action'),
    ('DN097', 'Harry Potter and the Deathly Hallows: Part 2', 'Daniel Radcliffe', 2011, 'Adventure'),
    ('DN0160', 'Office Christmas Party', 'Jason Bateman', 2016, 'Comedy'),
    ('DN0195', 'The Neon Demon', 'Elle Fanning', 2016, 'Horror'),
    ('DN045', 'Dangal', 'Aamir Khan', 2016, 'Action'),
    ('DN0168', '10 Cloverfield Lane', 'John Goodman', 2016, 'Drama'),
    ('DN079', 'Finding Dory', 'Ellen DeGeneres', 2016, 'Animation'),
    ('DN081', 'Miss Peregrine''s Home for Peculiar Children', 'Eva Green', 2016, 'Adventure'),
    ('DN0106', 'Divergent', 'Shailene Woodley', 2014, 'Adventure'),
    ('DN020', 'Mike and Dave Need Wedding Dates', 'Zac Efron', 2016, 'Adventure'),
    ('DN069', 'Boyka: Undisputed IV', 'Scott Adkins', 2016, 'Action'),
    ('DN002', 'The Dark Knight Rises', 'Christian Bale', 2012, 'Superhero'),
    ('DN0104', 'The Jungle Book', 'Neel Sethi', 2016, 'Adventure'),
    ('DN027', 'Transformers: Age of Extinction', 'Mark Wahlberg', 2014, 'Action'),
    ('DN0136', 'Nerve', 'Emma Roberts', 2016, 'Adventure'),
    ('DN084', 'Mamma Mia!', 'Meryl Streep', 2008, 'Comedy'),
    ('DN0185', 'The Revenant', 'Leonardo DiCaprio', 2015, 'Adventure'),
    ('DN0130', 'Fences', 'Denzel Washington', 2016, 'Drama'),
    ('DN004', 'Into the Woods', 'Anna Kendrick', 2014, 'Adventure'),
    ('DN021', 'The Shallows', 'Blake Lively', 2016, 'Drama'),
    ('DN0165', 'Whiplash', 'Miles Teller', 2014, 'Drama'),
    ('DN0131', 'Furious 6', 'Vin Diesel', 2013, 'Action'),
    ('DN035', 'The Place Beyond the Pines', 'Ryan Gosling', 2012, 'Crime'),
    ('DN008', 'No Country for Old Men', 'Tommy Lee Jones', 2007, 'Crime'),
    ('DN0133', 'The Great Gatsby', 'Leonardo DiCaprio', 2013, 'Drama'),
    ('DN0110', 'Shutter Island', 'Leonardo DiCaprio', 2010, 'Mystery'),
    ('DN0176', 'Brimstone', 'Dakota Fanning', 2016, 'Mystery'),
    ('DN058', 'Star Trek', 'Chris Pine', 2009, 'Action'),
    ('DN047', 'Diary of a Wimpy Kid', 'Zachary Gordon', 2010, 'Comedy'),
    ('DN0147', 'The Big Short', 'Christian Bale', 2015, 'Biography'),
    ('DN0182', 'Room', 'Brie Larson', 2015, 'Drama'),
    ('DN0199', 'Django Unchained', 'Jamie Foxx', 2012, 'Drama'),
    ('DN063', 'Ah-ga-ssi', 'Min-hee Kim', 2016, 'Drama'),
    ('DN022', 'The Edge of Seventeen', 'Hailee Steinfeld', 2016, 'Comedy'),
    ('DN036', 'Watchmen', 'Jackie Earle Haley', 2009, 'Superhero'),
    ('DN043', 'Superbad', 'Michael Cera', 2007, 'Comedy'),
    ('DN091', 'Inferno', 'Tom Hanks', 2016, 'Action'),
    ('DN0134', 'The BFG', 'Mark Rylance', 2016, 'Adventure'),
    ('DN055', 'The Hunger Games', 'Jennifer Lawrence', 2012, 'Adventure'),
    ('DN071', 'White Girl', 'Morgan Saylor', 2016, 'Drama'),
    ('DN0121', 'Sicario', 'Emily Blunt', 2015, 'Action'),
    ('DN0191', 'Twin Peaks: The Missing Pieces', 'Chris Isaak', 2014, 'Drama'),
    ('DN030', 'Aliens vs Predator - Requiem', 'Reiko Aylesworth', 2007, 'Action'),
    ('DN0105', 'Pacific Rim', 'Idris Elba', 2013, 'Action'),
    ('DN0148', 'Crazy, Stupid, Love.', 'Steve Carell', 2011, 'Comedy'),
    ('DN0184', 'Scott Pilgrim vs. the World', 'Michael Cera', 2010, 'Action'),
    ('DN005', 'Hot Fuzz', 'Simon Pegg', 2007, 'Action'),
    ('DN017', 'Mine', 'Armie Hammer', 2016, 'Thriller'),
    ('DN066', 'Free Fire', 'Sharlto Copley', 2016, 'Action'),
    ('DN009', 'X-Men: Days of Future Past', 'Patrick Stewart', 2014, 'Superhero'),
    ('DN0189', 'Jack Reacher: Never Go Back', 'Tom Cruise', 2016, 'Action'),
    ('DN023', 'Casino Royale', 'Daniel Craig', 2006, 'Action'),
    ('DN024', 'Twilight', 'Kristen Stewart', 2008, 'Drama'),
    ('DN076', 'Now You See Me 2', 'Jesse Eisenberg', 2016, 'Action'),
    ('DN0173', 'Woman in Gold', 'Helen Mirren', 2015, 'Biography'),
    ('DN096', '13 Hours', 'John Krasinski', 2016, 'Action'),
    ('DN007', 'Spectre', 'Daniel Craig', 2015, 'Action'),
    ('DN059', 'Nightcrawler', 'Jake Gyllenhaal', 2014, 'Crime'),
    ('DN028', 'Kubo and the Two Strings', 'Charlize Theron', 2016, 'Animation'),
    ('DN099', 'Beyond the Gates', 'Graham Skipper', 2016, 'Adventure'),
    ('DN075', 'Her', 'Joaquin Phoenix', 2013, 'Drama'),
    ('DN0170', 'Frozen', 'Kristen Bell', 2013, 'Animation'),
    ('DN0169', 'Tomorrowland', 'George Clooney', 2015, 'Action'),
    ('DN044', 'Dawn of the Planet of the Apes', 'Gary Oldman', 2014, 'Action'),
    ('DN0124', 'Tropic Thunder', 'Ben Stiller', 2008, 'Action'),
    ('DN031', 'The Conjuring 2', 'Vera Farmiga', 2016, 'Horror'),
    ('DN034', 'Ant-Man', 'Paul Rudd', 2015, 'Superhero'),
    ('DN054', 'Bridget Jones''s Baby', 'RenÃÂ©e Zellweger', 2016, 'Comedy'),
    ('DN0162', 'The VVitch: A New-England Folktale', 'Anya Taylor-Joy', 2015, 'Horror'),
    ('DN0178', 'Cinderella', 'Lily James', 2015, 'Drama'),
    ('DN093', 'Realive', 'Tom Hughes', 2016, 'Sci-Fi'),
    ('DN094', 'Forushande', 'Taraneh Alidoosti', 2016, 'Drama'),
    ('DN010', 'Love', 'Aomi Muyock', 2015, 'Drama'),
    ('DN067', 'Billy Lynn''s Long Halftime Walk', 'Joe Alwyn', 2016, 'Drama'),
    ('DN098', 'Crimson Peak', 'Mia Wasikowska', 2015, 'Drama'),
    ('DN057', 'Drive', 'Ryan Gosling', 2011, 'Crime'),
    ('DN0113', 'Trainwreck', 'Amy Schumer', 2015, 'Comedy'),
    ('DN0193', 'The Light Between Oceans', 'Michael Fassbender', 2016, 'Drama'),
    ('DN016', 'Below Her Mouth', 'Erika Linder', 2016, 'Drama'),
    ('DN0119', 'Spotlight', 'Mark Ruffalo', 2015, 'Crime'),
    ('DN0137', 'Morgan', 'Kate Mara', 2016, 'Horror'),
    ('DN018', 'Warrior', 'Tom Hardy', 2011, 'Action'),
    ('DN086', 'Captain America: The First Avenger', 'Chris Evans', 2011, 'Superhero'),
    ('DN0153', 'Hacker', 'Callan McAuliffe', 2016, 'Crime'),
    ('DN0122', 'Into the Wild', 'Emile Hirsch', 2007, 'Adventure'),
    ('DN0172', 'The Imitation Game', 'Benedict Cumberbatch', 2014, 'Biography'),
    ('DN077', 'Central Intelligence', 'Dwayne Johnson', 2016, 'Action');

INSERT INTO COPY (Copy_No, DVD_No, Shelf_Position) VALUES
    ('CN1099', 'DN050', 'AV123'),
    ('CN8739', 'DN0140', 'AC8728'),
    ('CN2045', 'DN0135', 'AV456'),
    ('CN3112', 'DN087', 'SH201'),
    ('CN4056', 'DN0102', 'AN302'),
    ('CN5201', 'DN025', 'AC415'),
    ('CN6089', 'DN0157', 'CO506'),
    ('CN7234', 'DN083', 'BI607'),
    ('CN8312', 'DN062', 'DR708'),
    ('CN9001', 'DN039', 'AC809'),
    ('CN1156', 'DN0188', 'SH910'),
    ('CN2278', 'DN0177', 'CO111'),
    ('CN3345', 'DN0129', 'AC212'),
    ('CN4489', 'DN085', 'AV313'),
    ('CN5567', 'DN070', 'BI414'),
    ('CN6623', 'DN048', 'AC515'),
    ('CN7790', 'DN0146', 'BI616'),
    ('CN8834', 'DN0151', 'DR717'),
    ('CN9912', 'DN056', 'CR818'),
    ('CN1267', 'DN0156', 'AN919'),
    ('CN2389', 'DN050', 'AV124'),
    ('CN3401', 'DN087', 'SH202'),
    ('CN4578', 'DN0140', 'AC729'),
    ('CN5634', 'DN062', 'DR709'),
    ('CN6756', 'DN0157', 'CO507');

INSERT INTO LOAN (Loan_No, Borrower_No, Loan_Date) VALUES
    ('LN74857', 'BN1721', '2002-06-02'),
    ('LN80123', 'BN2034', '2002-06-05'),
    ('LN80456', 'BN3156', '2002-06-08'),
    ('LN80789', 'BN5012', '2002-06-10'),
    ('LN81012', 'BN6378', '2002-06-12'),
    ('LN81345', 'BN7491', '2002-06-15'),
    ('LN81678', 'BN8654', '2002-06-18'),
    ('LN81901', 'BN1045', '2002-06-20'),
    ('LN82234', 'BN1721', '2002-07-01'),
    ('LN82567', 'BN2034', '2002-07-05');

INSERT INTO LOAN_COPY (Loan_No, Copy_No, DVD_Status, Return_Due_Date) VALUES
    ('LN74857', 'CN1099', 'On Loan', '2002-06-16'),
    ('LN74857', 'CN8739', 'On Loan', '2002-06-16'),
    ('LN80123', 'CN2045', 'Returned', '2002-06-19'),
    ('LN80123', 'CN3112', 'On Loan', '2002-06-19'),
    ('LN80456', 'CN4056', 'Returned', '2002-06-22'),
    ('LN80789', 'CN5201', 'On Loan', '2002-06-24'),
    ('LN80789', 'CN6089', 'On Loan', '2002-06-24'),
    ('LN81012', 'CN7234', 'Returned', '2002-06-26'),
    ('LN81345', 'CN8312', 'On Loan', '2002-06-29'),
    ('LN81345', 'CN9001', 'On Loan', '2002-06-29'),
    ('LN81678', 'CN1156', 'Returned', '2002-07-02'),
    ('LN81678', 'CN2278', 'Returned', '2002-07-02'),
    ('LN81901', 'CN3345', 'On Loan', '2002-07-04'),
    ('LN82234', 'CN4489', 'On Loan', '2002-07-15'),
    ('LN82234', 'CN5567', 'On Loan', '2002-07-15'),
    ('LN82567', 'CN6623', 'Returned', '2002-07-19'),
    ('LN82567', 'CN7790', 'On Loan', '2002-07-19'),
    ('LN82567', 'CN2389', 'On Loan', '2002-07-19');

SELECT * FROM RENTAL_CATEGORY ORDER BY Rental_Category;
SELECT * FROM BORROWER ORDER BY Borrower_No;
SELECT * FROM DVD ORDER BY DVD_No LIMIT 20;
SELECT * FROM COPY ORDER BY Copy_No;
SELECT * FROM LOAN ORDER BY Loan_No;
SELECT * FROM LOAN_COPY ORDER BY Loan_No, Copy_No;

SELECT DISTINCT
    b.Borrower_No,
    b.Borrower_Name,
    b.Borrower_Address,
    b.Borrower_Status
FROM BORROWER b
    INNER JOIN LOAN l        ON b.Borrower_No = l.Borrower_No
    INNER JOIN LOAN_COPY lc  ON l.Loan_No     = lc.Loan_No
WHERE lc.DVD_Status = 'On Loan'
ORDER BY SUBSTRING_INDEX(b.Borrower_Name, ' ', -1) ASC;


-- =============================================
-- (ii) Borrowers with overdue loans, ranked highest to lowest
-- =============================================

SELECT
    b.Borrower_No,
    b.Borrower_Name,
    b.Borrower_Address,
    COUNT(lc.Copy_No)               AS Overdue_Items,
    MIN(lc.Return_Due_Date)         AS Earliest_Due_Date
FROM BORROWER b
    INNER JOIN LOAN l        ON b.Borrower_No = l.Borrower_No
    INNER JOIN LOAN_COPY lc  ON l.Loan_No     = lc.Loan_No
WHERE lc.DVD_Status      = 'On Loan'
  AND lc.Return_Due_Date < CURDATE()
GROUP BY b.Borrower_No, b.Borrower_Name, b.Borrower_Address
ORDER BY Overdue_Items DESC;


-- =============================================
-- (iii) Borrower details and DVDs for comedy rentals in the last 4 weeks
-- =============================================

SELECT
    b.Borrower_No,
    b.Borrower_Name,
    b.Borrower_Address,
    d.DVD_No,
    d.DVD_Title,
    d.DVD_Starring_Actor,
    l.Loan_Date,
    lc.Return_Due_Date
FROM BORROWER b
    INNER JOIN LOAN l        ON b.Borrower_No    = l.Borrower_No
    INNER JOIN LOAN_COPY lc  ON l.Loan_No        = lc.Loan_No
    INNER JOIN COPY cp       ON lc.Copy_No       = cp.Copy_No
    INNER JOIN DVD d         ON cp.DVD_No        = d.DVD_No
    INNER JOIN RENTAL_CATEGORY rc ON d.Rental_Category = rc.Rental_Category
WHERE rc.Rental_Category = 'Comedy'
  AND l.Loan_Date >= DATE_SUB(CURDATE(), INTERVAL 28 DAY)
ORDER BY b.Borrower_Name, l.Loan_Date;


-- =============================================
-- (iv) Borrower with the highest accumulated overdue fines
--      Fine rate: £1.00 per day overdue per item
-- =============================================

SELECT
    b.Borrower_No,
    b.Borrower_Name,
    b.Borrower_Address,
    b.Borrower_Status,
    COUNT(lc.Copy_No)                           AS Overdue_Items,
    SUM(DATEDIFF(CURDATE(), lc.Return_Due_Date))
                                                AS Total_Days_Overdue,
    CONCAT('£', FORMAT(
        SUM(DATEDIFF(CURDATE(), lc.Return_Due_Date)) * 1.00,
        2))                                     AS Total_Fine
FROM BORROWER b
    INNER JOIN LOAN l        ON b.Borrower_No = l.Borrower_No
    INNER JOIN LOAN_COPY lc  ON l.Loan_No     = lc.Loan_No
WHERE lc.DVD_Status      = 'On Loan'
  AND lc.Return_Due_Date < CURDATE()
GROUP BY b.Borrower_No, b.Borrower_Name,
         b.Borrower_Address, b.Borrower_Status
ORDER BY Total_Days_Overdue DESC
LIMIT 1;


-- =============================================
-- (v) Update rental cost to £5.50 for superhero DVDs where year >= 2015
-- =============================================

-- Step 1: Preview affected rows
SELECT
    d.DVD_No,
    d.DVD_Title,
    d.DVD_Year,
    d.Rental_Category,
    rc.Rental_Cost  AS Current_Cost
FROM DVD d
    INNER JOIN RENTAL_CATEGORY rc ON d.Rental_Category = rc.Rental_Category
WHERE d.Rental_Category = 'Superhero'
  AND d.DVD_Year >= 2015;

-- Step 2: Create a new category at the higher price
INSERT INTO RENTAL_CATEGORY (Rental_Category, Rental_Cost)
VALUES ('Superhero Premium', 5.50);

-- Step 3: Reassign qualifying DVDs to the new category
UPDATE DVD
SET Rental_Category = 'Superhero Premium'
WHERE Rental_Category = 'Superhero'
  AND DVD_Year >= 2015;

-- Step 4: Verify the update
SELECT
    d.DVD_No,
    d.DVD_Title,
    d.DVD_Year,
    d.Rental_Category,
    rc.Rental_Cost  AS New_Cost
FROM DVD d
    INNER JOIN RENTAL_CATEGORY rc ON d.Rental_Category = rc.Rental_Category
WHERE d.Rental_Category = 'Superhero Premium'
ORDER BY d.DVD_Year, d.DVD_Title;


-- 1. Output all borrowers who have current rentals and order them by surname.
SELECT
    d.DVD_No,
    d.DVD_Title,
    d.Rental_Category
FROM DVD d
WHERE d.DVD_No NOT IN (
    SELECT DISTINCT cp.DVD_No
    FROM COPY cp
        INNER JOIN LOAN_COPY lc ON cp.Copy_No = lc.Copy_No
)
ORDER BY d.DVD_No;

-- 2. Create a list that shows all borrowers who have over-due loans and rank them highest to lowest.

SELECT
    b.Borrower_No,
    b.Borrower_Name,
    b.Borrower_Address,
    COUNT(lc.Copy_No)               AS Overdue_Items,
    MIN(lc.Return_Due_Date)         AS Earliest_Due_Date
FROM BORROWER b
    INNER JOIN LOAN l        ON b.Borrower_No = l.Borrower_No
    INNER JOIN LOAN_COPY lc  ON l.Loan_No     = lc.Loan_No
WHERE lc.DVD_Status      = 'On Loan'
  AND lc.Return_Due_Date < CURDATE()
GROUP BY b.Borrower_No, b.Borrower_Name, b.Borrower_Address
ORDER BY Overdue_Items DESC;

-- 3. Display the borrower details and DVDs for all borrowers who have rented comedy movies in the last 4 weeks.

SELECT
    b.Borrower_No,
    b.Borrower_Name,
    b.Borrower_Address,
    d.DVD_No,
    d.DVD_Title,
    d.DVD_Starring_Actor,
    l.Loan_Date,
    lc.Return_Due_Date
FROM BORROWER b
    INNER JOIN LOAN l        ON b.Borrower_No    = l.Borrower_No
    INNER JOIN LOAN_COPY lc  ON l.Loan_No        = lc.Loan_No
    INNER JOIN COPY cp       ON lc.Copy_No       = cp.Copy_No
    INNER JOIN DVD d         ON cp.DVD_No        = d.DVD_No
    INNER JOIN RENTAL_CATEGORY rc ON d.Rental_Category = rc.Rental_Category
WHERE rc.Rental_Category = 'Comedy'
  AND l.Loan_Date >= DATE_SUB(CURDATE(), INTERVAL 28 DAY)
ORDER BY b.Borrower_Name, l.Loan_Date;

-- 4. Find the borrower who has accumulate the most over-due finds, calculate the total in fines and display their details.

SELECT
    b.Borrower_No,
    b.Borrower_Name,
    b.Borrower_Address,
    b.Borrower_Status,
    COUNT(lc.Copy_No)                           AS Overdue_Items,
    SUM(DATEDIFF(CURDATE(), lc.Return_Due_Date))
                                                AS Total_Days_Overdue,
    CONCAT('£', FORMAT(
        SUM(DATEDIFF(CURDATE(), lc.Return_Due_Date)) * 1.00,
        2))                                     AS Total_Fine
FROM BORROWER b
    INNER JOIN LOAN l        ON b.Borrower_No = l.Borrower_No
    INNER JOIN LOAN_COPY lc  ON l.Loan_No     = lc.Loan_No
WHERE lc.DVD_Status      = 'On Loan'
  AND lc.Return_Due_Date < CURDATE()
GROUP BY b.Borrower_No, b.Borrower_Name,
         b.Borrower_Address, b.Borrower_Status
ORDER BY Total_Days_Overdue DESC
LIMIT 1;

-- 5. Update the cost for rentals where the release date is >=2015 to £5.50 and the movie category is superhero.

SELECT
    d.DVD_No,
    d.DVD_Title,
    d.DVD_Year,
    d.Rental_Category,
    rc.Rental_Cost  AS Current_Cost
FROM DVD d
    INNER JOIN RENTAL_CATEGORY rc ON d.Rental_Category = rc.Rental_Category
WHERE d.Rental_Category = 'Superhero'
  AND d.DVD_Year >= 2015;

INSERT INTO RENTAL_CATEGORY (Rental_Category, Rental_Cost)
VALUES ('Superhero Premium', 5.50);

UPDATE DVD
SET Rental_Category = 'Superhero Premium'
WHERE Rental_Category = 'Superhero'
  AND DVD_Year >= 2015;

SELECT
    d.DVD_No,
    d.DVD_Title,
    d.DVD_Year,
    d.Rental_Category,
    rc.Rental_Cost  AS New_Cost
FROM DVD d
    INNER JOIN RENTAL_CATEGORY rc ON d.Rental_Category = rc.Rental_Category
WHERE d.Rental_Category = 'Superhero Premium'
ORDER BY d.DVD_Year, d.DVD_Title;