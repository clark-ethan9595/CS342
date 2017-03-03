-- Insert sample data into the MIAA Fantasy Basketball database
-- Ethan Clark - CS 342

INSERT INTO SCHOOL VALUES (1, 'Calvin College', 'Grand Rapids', 'MI');
INSERT INTO SCHOOL VALUES (2, 'Hope College', 'Holland', 'MI');
INSERT INTO SCHOOL VALUES (3, 'Trine University', 'Angola', 'IN');
INSERT INTO SCHOOL VALUES (4, 'Adrian College', 'Adrian', 'MI');
INSERT INTO SCHOOL VALUES (5, 'Albion College', 'Albion', 'MI');
INSERT INTO SCHOOL VALUES (6, 'Alma College', 'Alma', 'MI');
INSERT INTO SCHOOL VALUES (7, 'Olivet College', 'Olivet', 'MI');

INSERT INTO Athlete VALUES (1, 'Cam', 'Denney', 'Bluffton', 'IN', 3.85, 'Senior', 'Forward', 1);
INSERT INTO Athlete VALUES (2, 'Tony', 'Canonie', 'South Haven', 'MI', 3.77, 'Junior', 'Guard', 1);
INSERT INTO Athlete VALUES (3, 'Michael', 'Welch', 'Stevensville', 'MI', 3.97, 'Senior', 'Center', 1);
INSERT INTO Athlete VALUES (4, 'Michael', 'Wilks', 'Hudsonville', 'MI', 3.00, 'Junior', 'Forward', 1);
INSERT INTO Athlete VALUES (5, 'Tony', 'DeWitte', 'Grandville', 'MI', 3.33, 'Freshman', 'Guard', 1);
INSERT INTO Athlete VALUES (6, 'Harrison', 'Blackledge', 'Canton', 'OH', 3.95, 'Senior', 'Forward', 2);
INSERT INTO Athlete VALUES (7, 'Dante', 'Hawkins', 'Holland', 'MI', 3.85, 'Junior', 'Guard', 2);
INSERT INTO Athlete VALUES (8, 'Chad', 'Carlson', 'Rockford', 'MI', 2.88, 'Senior', 'Guard', 2);
INSERT INTO Athlete VALUES (9, 'Cody', 'Stiuve', 'Hudsonville', 'MI', 3.75, 'Senior', 'Forward', 2);
INSERT INTO Athlete VALUES (10, 'Keith', 'Brushwyler', 'Saint Joseph', 'MI', 3.03, 'Senior', 'Forward', 2);
INSERT INTO Athlete VALUES (11, 'Will', 'Dixon', 'Indianapolis', 'IN', 3.89, 'Senior', 'Guard', 3);
INSERT INTO Athlete VALUES (12, 'Austin', 'Penick', 'LaGrange', 'IN', 4.00, 'Freshman', 'Guard', 3);
INSERT INTO Athlete VALUES (13, 'Kyle', 'Dodson', 'Centerville', 'OH', 3.65, 'Sophomore', 'Guard', 3);
INSERT INTO Athlete VALUES (14, 'Jason', 'Clune', 'Meadville', 'PA', 3.14, 'Freshman', 'Guard', 3);
INSERT INTO Athlete VALUES (15, 'Darek', 'Ditto', 'Mattawan', 'MI', 2.55, 'Sophomore', 'Forward', 3);
INSERT INTO Athlete VALUES (16, 'Kylynn', 'Willis', 'Highland Park', 'MI', 2.98, 'Sophomore', 'Guard', 4);
INSERT INTO Athlete VALUES (17, 'Jackson', 'Patton', 'Lake Somerset', 'MI', 3.09, 'Freshman', 'Guard', 4);
INSERT INTO Athlete VALUES (18, 'Andrew', 'Landini', 'Farmington', 'CN', 3.94, 'Sophomore', 'Guard', 4);
INSERT INTO Athlete VALUES (19, 'Justin', 'Webster', 'Adrian', 'MI', 3.57, 'Junior', 'Forward', 4);
INSERT INTO Athlete VALUES (20, 'Chad', 'Mossing', 'Metamore', 'OH', 3.44, 'Senior', 'Guard', 4);
INSERT INTO Athlete VALUES (21, 'Jaylin', 'Fordham', 'Flint', 'MI', 3.08, 'Freshman', 'Guard', 5);
INSERT INTO Athlete VALUES (22, 'Sean', 'Kelly', 'Cedar Lake', 'IN', 2.51, 'Sophomore', 'Center', 5);
INSERT INTO Athlete VALUES (23, 'Travell', 'Oakes', 'Muskegon', 'MI', 3.92, 'Senior', 'Forward', 5);
INSERT INTO Athlete VALUES (24, 'Gordon', 'Post', 'Gross Pointe', 'MI', 3.49, 'Sophomore', 'Forward', 5);
INSERT INTO Athlete VALUES (25, 'Jason', 'Zahran', 'Trenton', 'MI', 3.85, 'Junior', 'Forward', 5);
INSERT INTO Athlete VALUES (26, 'Tyler', 'Edwards', 'Flint', 'MI', 3.02, 'Senior', 'Forward', 6);
INSERT INTO Athlete VALUES (27, 'Nick', 'LoMonaco', 'Caledonia', 'MI', 4.00, 'Junior', 'Guard', 6);
INSERT INTO Athlete VALUES (28, 'Jared', 'Long', 'Montrose', 'MI', 3.39, 'Freshman', 'Guard', 6);
INSERT INTO Athlete VALUES (29, 'Ryan', 'Stevens', 'Lowell', 'MI', 3.82, 'Freshman', 'Guard', 6);
INSERT INTO Athlete VALUES (30, 'Trevor', 'Gernaat', 'McBain', 'MI', 3.28, 'Senior', 'Forward', 6);
INSERT INTO Athlete VALUES (31, 'P.J.', 'Trammell', 'Holland', 'MI', 3.89, 'Junior', 'Guard', 7);
INSERT INTO Athlete VALUES (32, 'Eric', 'Ewing', 'Harper Woods', 'MI', 3.40, 'Senior', 'Guard', 7);
INSERT INTO Athlete VALUES (33, 'Jordan', 'Ellis', 'Detroi', 'MI', 3.91, 'Sophomore', 'Guard', 7);
INSERT INTO Athlete VALUES (34, 'R.J.', 'Haas', 'Albion', 'MI', 3.08, 'Sophomore', 'Forward', 7);
INSERT INTO Athlete VALUES (35, 'Aaron', 'Washington', 'Fort Wayne', 'IN', 2.98, 'Senior', 'Guard', 7);

INSERT INTO Match VALUES (1, '2017-03-10 06:44:55', 1, 2);
INSERT INTO Match VALUES (2, '2017-01-12 22:52:53', 1, 3);
INSERT INTO Match VALUES (3, '2016-12-29 20:47:14', 4, 1);
INSERT INTO Match VALUES (4, '2016-12-26 00:58:31', 5, 4);
INSERT INTO Match VALUES (5, '2017-02-11 18:56:48', 7, 6);
INSERT INTO Match VALUES (6, '2017-02-16 06:55:30', 2, 7);
INSERT INTO Match VALUES (7, '2017-02-11 16:16:05', 7, 1);
INSERT INTO Match VALUES (8, '2017-01-12 14:17:58', 6, 1);
INSERT INTO Match VALUES (9, '2017-01-29 14:13:39', 1, 5);
INSERT INTO Match VALUES (10, '2017-02-07 19:59:58', 2, 3);
INSERT INTO Match VALUES (11, '2017-01-30 12:39:39', 2, 6);
INSERT INTO Match VALUES (12, '2016-12-02 07:14:39', 5, 2);
INSERT INTO Match VALUES (13, '2017-02-15 20:55:12', 4, 2);
INSERT INTO Match VALUES (14, '2017-01-31 19:54:24', 3, 4);
INSERT INTO Match VALUES (15, '2016-12-07 09:46:13', 3, 5);
INSERT INTO Match VALUES (16, '2017-01-06 04:05:07', 6, 3);
INSERT INTO Match VALUES (17, '2016-11-24 17:20:54', 3, 7);
INSERT INTO Match VALUES (18, '2016-12-17 13:11:03', 4, 6);
INSERT INTO Match VALUES (19, '2016-11-10 18:58:27', 7, 4);
INSERT INTO Match VALUES (20, '2017-03-13 14:37:31', 5, 7);
INSERT INTO Match VALUES (21, '2017-02-18 17:00:00', 6, 5);

INSERT INTO League VALUES (1, 'fantasyLeagueCalvin', '2016-10-27 02:00:44');
INSERT INTO League VALUES (2, 'MIAArulez', '2016-10-26 23:55:03');
INSERT INTO League VALUES (3, 'baller4life', '2016-10-25 09:18:16');
INSERT INTO League VALUES (4, 'hoopsTillFall', '2016-10-29 08:53:51');
INSERT INTO League VALUES (5, 'baksetballMadness', '2016-10-26 20:34:45');

INSERT INTO User VALUES (1, 'parnold0', 'Patricia', 'Arnold', 5);
INSERT INTO User VALUES (2, 'grogers1', 'Gary', 'Rogers', 4);
INSERT INTO User VALUES (3, 'hknight2', 'Howard', 'Knight', 2);
INSERT INTO User VALUES (4, 'escott3', 'Elizabeth', 'Scott', 2);
INSERT INTO User VALUES (5, 'twilliamson4', 'Thomas', 'Williamson', 1);
INSERT INTO User VALUES (6, 'drichardson5', 'Diana', 'Richardson', 4);
INSERT INTO User VALUES (7, 'pfisher6', 'Phyllis', 'Fisher', 3);
INSERT INTO User VALUES (8, 'bmills7', 'Beverly', 'Mills', 5);
INSERT INTO User VALUES (9, 'fjacobs8', 'Fred', 'Jacobs', 3);
INSERT INTO User VALUES (10, 'abanks9', 'Adam', 'Banks', 2);
INSERT INTO User VALUES (11, 'lperrya', 'Lillian', 'Perry', 5);
INSERT INTO User VALUES (12, 'jcooperb', 'Judy', 'Cooper', 2);
INSERT INTO User VALUES (13, 'lmedinac', 'Lillian', 'Medina', 3);
INSERT INTO User VALUES (14, 'sspencerd', 'Shirley', 'Spencer', 1);
INSERT INTO User VALUES (15, 'scartere', 'Scott', 'Carter', 4);
INSERT INTO User VALUES (16, 'dcarterf', 'Daniel', 'Carter', 1);
INSERT INTO User VALUES (17, 'jgreeneg', 'James', 'Greene', 5);
INSERT INTO User VALUES (18, 'sberryh', 'Shawn', 'Berry', 2);
INSERT INTO User VALUES (19, 'acarteri', 'Anna', 'Carter', 5);
INSERT INTO User VALUES (20, 'jfoxj', 'John', 'Fox', 4);

INSERT INTO Team VALUES (1, 'The United Falcons', 20, 10, 15, 1, 1);
INSERT INTO Team VALUES (2, 'The Magic Lobsters', 18, 8, 10, 2, 1);
INSERT INTO Team VALUES (3, 'The Bright Angels', 1, 11, 1, 3, 1);
INSERT INTO Team VALUES (4, 'What Am I Doing', 6, 10, 17, 4, 1);
INSERT INTO Team VALUES (5, 'The Flawless Wings', 18, 10, 13, 5, 2);
INSERT INTO Team VALUES (6, 'The Bold Storm', 1, 12, 1, 6, 2);
INSERT INTO Team VALUES (7, 'Basic Ballers', 16, 10, 2, 7, 2);
INSERT INTO Team VALUES (8, 'Extreme Panthers', 19, 12, 14, 8, 2);
INSERT INTO Team VALUES (9, 'American Sonics', 7, 18, 8, 9, 2);
INSERT INTO Team VALUES (10, 'Michigan Wild', 20, 18, 6, 10, 3);
INSERT INTO Team VALUES (11, 'Green Scorpions', 1, 14, 1, 11, 3);
INSERT INTO Team VALUES (12, 'The Pricey Pandas', 8, 12, 10, 12, 3);
INSERT INTO Team VALUES (13, 'The Zonked Tigers', 13, 4, 15, 13, 3);
INSERT INTO Team VALUES (14, 'The Lonely Rabbits', 7, 1, 11, 14, 4);
INSERT INTO Team VALUES (15, 'Team Ball So Hard', 18, 3, 11, 15, 4);
INSERT INTO Team VALUES (16, 'McBuckets', 19, 9, 9, 16, 4);
INSERT INTO Team VALUES (17, 'The GOAT', 8, 12, 17, 17, 4);
INSERT INTO Team VALUES (18, 'Doctor J', 11, 16, 14, 18, 5);
INSERT INTO Team VALUES (19, 'Dunkaroo', 1, 19, 7, 19, 5);
INSERT INTO Team VALUES (20, 'Pistons', 11, 11, 7, 20, 5);

INSERT INTO Athlete_Team VALUES (1, 1);
INSERT INTO Athlete_Team VALUES (1, 20);
INSERT INTO Athlete_Team VALUES (1, 13);
INSERT INTO Athlete_Team VALUES (1, 9);
INSERT INTO Athlete_Team VALUES (1, 28);

INSERT INTO Athlete_Team VALUES (2, 14);
INSERT INTO Athlete_Team VALUES (2, 30);
INSERT INTO Athlete_Team VALUES (2, 22);
INSERT INTO Athlete_Team VALUES (2, 10);
INSERT INTO Athlete_Team VALUES (2, 19);

INSERT INTO Athlete_Team VALUES (3, 16);
INSERT INTO Athlete_Team VALUES (3, 35);
INSERT INTO Athlete_Team VALUES (3, 5);
INSERT INTO Athlete_Team VALUES (3, 12);
INSERT INTO Athlete_Team VALUES (3, 29);

INSERT INTO Athlete_Team VALUES (4, 21);
INSERT INTO Athlete_Team VALUES (4, 4);
INSERT INTO Athlete_Team VALUES (4, 33);
INSERT INTO Athlete_Team VALUES (4, 15);
INSERT INTO Athlete_Team VALUES (4, 31);

INSERT INTO Athlete_Team VALUES (5, 1);
INSERT INTO Athlete_Team VALUES (5, 3);
INSERT INTO Athlete_Team VALUES (5, 11);
INSERT INTO Athlete_Team VALUES (5, 17);
INSERT INTO Athlete_Team VALUES (5, 24);

INSERT INTO Athlete_Team VALUES (6, 2);
INSERT INTO Athlete_Team VALUES (6, 8);
INSERT INTO Athlete_Team VALUES (6, 16);
INSERT INTO Athlete_Team VALUES (6, 27);
INSERT INTO Athlete_Team VALUES (6, 20);

INSERT INTO Athlete_Team VALUES (7, 4);
INSERT INTO Athlete_Team VALUES (7, 9);
INSERT INTO Athlete_Team VALUES (7, 21);
INSERT INTO Athlete_Team VALUES (7, 23);
INSERT INTO Athlete_Team VALUES (7, 24);

INSERT INTO Athlete_Team VALUES (8, 5);
INSERT INTO Athlete_Team VALUES (8, 10);
INSERT INTO Athlete_Team VALUES (8, 14);
INSERT INTO Athlete_Team VALUES (8, 26);
INSERT INTO Athlete_Team VALUES (8, 32);

INSERT INTO Athlete_Team VALUES (9, 6);
INSERT INTO Athlete_Team VALUES (9, 7);
INSERT INTO Athlete_Team VALUES (9, 18);
INSERT INTO Athlete_Team VALUES (9, 19);
INSERT INTO Athlete_Team VALUES (9, 25);

INSERT INTO Athlete_Team VALUES (10, 3);
INSERT INTO Athlete_Team VALUES (10, 22);
INSERT INTO Athlete_Team VALUES (10, 19);
INSERT INTO Athlete_Team VALUES (10, 26);
INSERT INTO Athlete_Team VALUES (10, 32);

INSERT INTO Athlete_Team VALUES (11, 4);
INSERT INTO Athlete_Team VALUES (11, 7);
INSERT INTO Athlete_Team VALUES (11, 15);
INSERT INTO Athlete_Team VALUES (11, 24);
INSERT INTO Athlete_Team VALUES (11, 14);

INSERT INTO Athlete_Team VALUES (12, 9);
INSERT INTO Athlete_Team VALUES (12, 16);
INSERT INTO Athlete_Team VALUES (12, 27);
INSERT INTO Athlete_Team VALUES (12, 28);
INSERT INTO Athlete_Team VALUES (12, 33);

INSERT INTO Athlete_Team VALUES (13, 11);
INSERT INTO Athlete_Team VALUES (13, 21);
INSERT INTO Athlete_Team VALUES (13, 25);
INSERT INTO Athlete_Team VALUES (13, 31);
INSERT INTO Athlete_Team VALUES (13, 35);

INSERT INTO Athlete_Team VALUES (14, 2);
INSERT INTO Athlete_Team VALUES (14, 12);
INSERT INTO Athlete_Team VALUES (14, 18);
INSERT INTO Athlete_Team VALUES (14, 25);
INSERT INTO Athlete_Team VALUES (14, 33);

INSERT INTO Athlete_Team VALUES (15, 6);
INSERT INTO Athlete_Team VALUES (15, 13);
INSERT INTO Athlete_Team VALUES (15, 20);
INSERT INTO Athlete_Team VALUES (15, 28);
INSERT INTO Athlete_Team VALUES (15, 34);

INSERT INTO Athlete_Team VALUES (16, 8);
INSERT INTO Athlete_Team VALUES (16, 14);
INSERT INTO Athlete_Team VALUES (16, 22);
INSERT INTO Athlete_Team VALUES (16, 29);
INSERT INTO Athlete_Team VALUES (16, 35);

INSERT INTO Athlete_Team VALUES (17, 10);
INSERT INTO Athlete_Team VALUES (17, 17);
INSERT INTO Athlete_Team VALUES (17, 23);
INSERT INTO Athlete_Team VALUES (17, 30);
INSERT INTO Athlete_Team VALUES (17, 31);

INSERT INTO Athlete_Team VALUES (18, 3);
INSERT INTO Athlete_Team VALUES (18, 9);
INSERT INTO Athlete_Team VALUES (18, 17);
INSERT INTO Athlete_Team VALUES (18, 13);
INSERT INTO Athlete_Team VALUES (18, 30);

INSERT INTO Athlete_Team VALUES (19, 2);
INSERT INTO Athlete_Team VALUES (19, 7);
INSERT INTO Athlete_Team VALUES (19, 21);
INSERT INTO Athlete_Team VALUES (19, 27);
INSERT INTO Athlete_Team VALUES (19, 35);

INSERT INTO Athlete_Team VALUES (20, 10);
INSERT INTO Athlete_Team VALUES (20, 12);
INSERT INTO Athlete_Team VALUES (20, 18);
INSERT INTO Athlete_Team VALUES (20, 24);
INSERT INTO Athlete_Team VALUES (20, 32);

INSERT INTO Athlete_Match  VALUES (1, 4, 2, 4, 4, 10, 8, 11);
INSERT INTO Athlete_Match  VALUES (1, 2, 27, 19, 9, 10, 1, 3);
INSERT INTO Athlete_Match  VALUES (1, 5, 7, 9, 4, 8, 5, 4);
INSERT INTO Athlete_Match  VALUES (1, 8, 11, 9, 3, 9, 8, 11);
INSERT INTO Athlete_Match  VALUES (1, 7, 38, 6, 6, 4, 5, 7);
INSERT INTO Athlete_Match  VALUES (1, 1, 9, 18, 10, 9, 7, 6);
INSERT INTO Athlete_Match  VALUES (1, 9, 35, 0, 3, 4, 4, 8);
INSERT INTO Athlete_Match  VALUES (1, 10, 23, 1, 5, 6, 3, 2);
INSERT INTO Athlete_Match  VALUES (1, 3, 29, 15, 13, 2, 6, 12);
INSERT INTO Athlete_Match  VALUES (1, 6, 38, 5, 7, 4, 3, 1);

INSERT INTO Athlete_Match  VALUES (2, 3, 30, 6, 12, 2, 7, 10);
INSERT INTO Athlete_Match  VALUES (2, 14, 13, 19, 10, 0, 0, 0);
INSERT INTO Athlete_Match  VALUES (2, 1, 16, 10, 13, 8, 3, 1);
INSERT INTO Athlete_Match  VALUES (2, 4, 1, 0, 5, 4, 6, 4);
INSERT INTO Athlete_Match  VALUES (2, 15, 38, 3, 15, 8, 1, 10);
INSERT INTO Athlete_Match  VALUES (2, 11, 1, 2, 13, 5, 2, 7);
INSERT INTO Athlete_Match  VALUES (2, 13, 27, 5, 14, 3, 7, 0);
INSERT INTO Athlete_Match  VALUES (2, 5, 35, 11, 14, 6, 1, 10);
INSERT INTO Athlete_Match  VALUES (2, 4, 25, 12, 14, 9, 2, 3);
INSERT INTO Athlete_Match  VALUES (2, 2, 17, 18, 10, 7, 0, 7);

INSERT INTO Athlete_Match  VALUES (3, 4, 31, 2, 9, 1, 4, 8);
INSERT INTO Athlete_Match  VALUES (3, 3, 24, 7, 8, 9, 0, 5);
INSERT INTO Athlete_Match  VALUES (3, 20, 24, 0, 6, 0, 4, 3);
INSERT INTO Athlete_Match  VALUES (3, 1, 18, 2, 9, 8, 3, 10);
INSERT INTO Athlete_Match  VALUES (3, 18, 7, 3, 9, 8, 7, 8);
INSERT INTO Athlete_Match  VALUES (3, 2, 29, 13, 13, 7, 8, 4);
INSERT INTO Athlete_Match  VALUES (3, 19, 16, 7, 0, 4, 1, 9);
INSERT INTO Athlete_Match  VALUES (3, 17, 16, 8, 1, 9, 5, 0);
INSERT INTO Athlete_Match  VALUES (3, 16, 8, 5, 14, 4, 3, 3);
INSERT INTO Athlete_Match  VALUES (3, 5, 36, 20, 2, 1, 4, 1);

INSERT INTO Athlete_Match  VALUES (4, 19, 18, 19, 14, 9, 0, 0);
INSERT INTO Athlete_Match  VALUES (4, 18, 40, 10, 4, 8, 1, 6);
INSERT INTO Athlete_Match  VALUES (4, 21, 14, 9, 9, 10, 2, 0);
INSERT INTO Athlete_Match  VALUES (4, 23, 2, 18, 12, 4, 6, 11);
INSERT INTO Athlete_Match  VALUES (4, 22, 24, 0, 11, 3, 6, 7);
INSERT INTO Athlete_Match  VALUES (4, 17, 22, 15, 13, 8, 0, 1);
INSERT INTO Athlete_Match  VALUES (4, 25, 31, 5, 7, 7, 4, 9);
INSERT INTO Athlete_Match  VALUES (4, 24, 40, 11, 11, 4, 1, 2);
INSERT INTO Athlete_Match  VALUES (4, 16, 7, 13, 11, 9, 8, 4);
INSERT INTO Athlete_Match  VALUES (4, 20, 25, 1, 0, 7, 5, 4);

INSERT INTO Athlete_Match  VALUES (5, 29, 21, 18, 8, 8, 2, 9);
INSERT INTO Athlete_Match  VALUES (5, 35, 3, 18, 11, 1, 4, 4);
INSERT INTO Athlete_Match  VALUES (5, 27, 13, 11, 9, 9, 4, 2);
INSERT INTO Athlete_Match  VALUES (5, 33, 24, 21, 5, 9, 0, 11);
INSERT INTO Athlete_Match  VALUES (5, 28, 15, 17, 3, 0, 6, 6);
INSERT INTO Athlete_Match  VALUES (5, 26, 40, 20, 1, 9, 2, 8);
INSERT INTO Athlete_Match  VALUES (5, 30, 9, 3, 7, 4, 6, 9);
INSERT INTO Athlete_Match  VALUES (5, 34, 16, 8, 6, 9, 8, 11);
INSERT INTO Athlete_Match  VALUES (5, 31, 18, 0, 1, 7, 5, 1);
INSERT INTO Athlete_Match  VALUES (5, 32, 4, 4, 3, 8, 0, 8);

INSERT INTO Athlete_Match  VALUES (6, 6, 26, 21, 1, 3, 7, 11);
INSERT INTO Athlete_Match  VALUES (6, 9, 18, 2, 3, 2, 4, 10);
INSERT INTO Athlete_Match  VALUES (6, 10, 10, 16, 14, 8, 7, 0);
INSERT INTO Athlete_Match  VALUES (6, 32, 36, 21, 0, 10, 7, 5);
INSERT INTO Athlete_Match  VALUES (6, 8, 37, 1, 14, 7, 8, 3);
INSERT INTO Athlete_Match  VALUES (6, 33, 18, 21, 1, 9, 1, 4);
INSERT INTO Athlete_Match  VALUES (6, 7, 1, 4, 3, 7, 0, 10);
INSERT INTO Athlete_Match  VALUES (6, 31, 35, 19, 0, 6, 7, 1);
INSERT INTO Athlete_Match  VALUES (6, 34, 39, 2, 15, 7, 1, 6);
INSERT INTO Athlete_Match  VALUES (6, 35, 1, 15, 6, 9, 0, 11);

INSERT INTO Athlete_Match  VALUES (7, 3, 22, 12, 11, 10, 0, 8);
INSERT INTO Athlete_Match  VALUES (7, 32, 35, 14, 14, 8, 3, 8);
INSERT INTO Athlete_Match  VALUES (7, 5, 13, 7, 11, 6, 6, 9);
INSERT INTO Athlete_Match  VALUES (7, 31, 9, 22, 13, 1, 5, 12);
INSERT INTO Athlete_Match  VALUES (7, 33, 36, 14, 12, 3, 5, 7);
INSERT INTO Athlete_Match  VALUES (7, 4, 25, 1, 13, 7, 7, 10);
INSERT INTO Athlete_Match  VALUES (7, 1, 12, 3, 13, 8, 4, 10);
INSERT INTO Athlete_Match  VALUES (7, 35, 15, 22, 14, 9, 8, 3);
INSERT INTO Athlete_Match  VALUES (7, 34, 25, 9, 14, 4, 4, 0);
INSERT INTO Athlete_Match  VALUES (7, 2, 18, 0, 2, 3, 2, 4);

INSERT INTO Athlete_Match  VALUES (8, 1, 10, 16, 11, 10, 7, 1);
INSERT INTO Athlete_Match  VALUES (8, 26, 2, 7, 9, 0, 6, 3);
INSERT INTO Athlete_Match  VALUES (8, 27, 37, 14, 11, 1, 7, 2);
INSERT INTO Athlete_Match  VALUES (8, 28, 5, 12, 6, 6, 4, 5);
INSERT INTO Athlete_Match  VALUES (8, 2, 36, 0, 13, 9, 6, 1);
INSERT INTO Athlete_Match  VALUES (8, 30, 37, 13, 1, 1, 8, 7);
INSERT INTO Athlete_Match  VALUES (8, 29, 22, 6, 5, 4, 0, 9);
INSERT INTO Athlete_Match  VALUES (8, 3, 39, 19, 0, 0, 0, 12);
INSERT INTO Athlete_Match  VALUES (8, 4, 4, 21, 7, 3, 0, 3);
INSERT INTO Athlete_Match  VALUES (8, 5, 5, 9, 3, 4, 4, 4);

INSERT INTO Athlete_Match  VALUES (9, 21, 34, 22, 12, 4, 6, 0);
INSERT INTO Athlete_Match  VALUES (9, 23, 0, 18, 3, 5, 5, 12);
INSERT INTO Athlete_Match  VALUES (9, 1, 1, 13, 10, 4, 3, 6);
INSERT INTO Athlete_Match  VALUES (9, 22, 38, 13, 8, 1, 5, 7);
INSERT INTO Athlete_Match  VALUES (9, 2, 14, 11, 13, 8, 3, 12);
INSERT INTO Athlete_Match  VALUES (9, 25, 13, 6, 5, 3, 7, 9);
INSERT INTO Athlete_Match  VALUES (9, 5, 30, 7, 9, 1, 3, 12);
INSERT INTO Athlete_Match  VALUES (9, 24, 22, 15, 9, 8, 0, 8);
INSERT INTO Athlete_Match  VALUES (9, 3, 39, 13, 11, 8, 5, 10);
INSERT INTO Athlete_Match  VALUES (9, 4, 38, 13, 1, 1, 3, 9);

INSERT INTO Athlete_Match  VALUES (10, 15, 34, 6, 15, 10, 3, 11);
INSERT INTO Athlete_Match  VALUES (10, 6, 34, 16, 1, 2, 3, 7);
INSERT INTO Athlete_Match  VALUES (10, 8, 3, 15, 3, 9, 6, 4);
INSERT INTO Athlete_Match  VALUES (10, 14, 10, 17, 12, 7, 5, 3);
INSERT INTO Athlete_Match  VALUES (10, 7, 2, 6, 6, 2, 7, 12);
INSERT INTO Athlete_Match  VALUES (10, 12, 0, 7, 3, 7, 3, 0);
INSERT INTO Athlete_Match  VALUES (10, 13, 22, 20, 11, 6, 5, 0);
INSERT INTO Athlete_Match  VALUES (10, 11, 2, 5, 8, 10, 1, 6);
INSERT INTO Athlete_Match  VALUES (10, 9, 28, 9, 8, 9, 5, 4);
INSERT INTO Athlete_Match  VALUES (10, 10, 19, 16, 7, 7, 4, 9);

INSERT INTO Athlete_Match  VALUES (11, 30, 22, 1, 13, 2, 8, 12);
INSERT INTO Athlete_Match  VALUES (11, 28, 14, 14, 13, 0, 3, 12);
INSERT INTO Athlete_Match  VALUES (11, 27, 18, 19, 5, 0, 1, 2);
INSERT INTO Athlete_Match  VALUES (11, 26, 35, 18, 10, 2, 5, 11);
INSERT INTO Athlete_Match  VALUES (11, 7, 39, 2, 9, 4, 0, 3);
INSERT INTO Athlete_Match  VALUES (11, 10, 26, 20, 14, 3, 1, 7);
INSERT INTO Athlete_Match  VALUES (11, 29, 11, 14, 0, 0, 6, 3);
INSERT INTO Athlete_Match  VALUES (11, 6, 36, 10, 2, 5, 7, 5);
INSERT INTO Athlete_Match  VALUES (11, 9, 35, 18, 3, 1, 6, 2);
INSERT INTO Athlete_Match  VALUES (11, 8, 35, 5, 6, 5, 8, 5);

INSERT INTO Athlete_Match  VALUES (12, 10, 38, 8, 7, 7, 4, 11);
INSERT INTO Athlete_Match  VALUES (12, 23, 24, 15, 7, 10, 4, 6);
INSERT INTO Athlete_Match  VALUES (12, 25, 40, 0, 13, 7, 0, 9);
INSERT INTO Athlete_Match  VALUES (12, 9, 18, 2, 12, 0, 3, 5);
INSERT INTO Athlete_Match  VALUES (12, 22, 26, 2, 13, 10, 0, 6);
INSERT INTO Athlete_Match  VALUES (12, 7, 4, 6, 3, 1, 1, 10);
INSERT INTO Athlete_Match  VALUES (12, 8, 7, 20, 8, 5, 6, 6);
INSERT INTO Athlete_Match  VALUES (12, 21, 35, 8, 5, 9, 4, 4);
INSERT INTO Athlete_Match  VALUES (12, 6, 5, 22, 3, 10, 5, 4);
INSERT INTO Athlete_Match  VALUES (12, 24, 40, 11, 7, 2, 3, 9);

INSERT INTO Athlete_Match  VALUES (13, 16, 8, 18, 11, 0, 7, 10);
INSERT INTO Athlete_Match  VALUES (13, 19, 21, 11, 0, 2, 6, 11);
INSERT INTO Athlete_Match  VALUES (13, 18, 37, 1, 2, 10, 6, 2);
INSERT INTO Athlete_Match  VALUES (13, 20, 12, 22, 15, 10, 8, 5);
INSERT INTO Athlete_Match  VALUES (13, 17, 13, 6, 3, 10, 5, 5);
INSERT INTO Athlete_Match  VALUES (13, 9, 0, 4, 4, 4, 1, 1);
INSERT INTO Athlete_Match  VALUES (13, 10, 3, 15, 11, 7, 3, 4);
INSERT INTO Athlete_Match  VALUES (13, 6, 33, 9, 6, 0, 2, 11);
INSERT INTO Athlete_Match  VALUES (13, 7, 12, 15, 3, 10, 6, 7);
INSERT INTO Athlete_Match  VALUES (13, 8, 2, 0, 15, 5, 2, 8);

INSERT INTO Athlete_Match  VALUES (14, 13, 6, 20, 12, 8, 0, 7);
INSERT INTO Athlete_Match  VALUES (14, 16, 36, 4, 15, 7, 1, 0);
INSERT INTO Athlete_Match  VALUES (14, 19, 5, 3, 4, 7, 6, 4);
INSERT INTO Athlete_Match  VALUES (14, 20, 1, 19, 3, 2, 8, 2);
INSERT INTO Athlete_Match  VALUES (14, 11, 37, 2, 9, 10, 4, 7);
INSERT INTO Athlete_Match  VALUES (14, 12, 27, 14, 7, 9, 5, 8);
INSERT INTO Athlete_Match  VALUES (14, 17, 36, 3, 10, 4, 3, 11);
INSERT INTO Athlete_Match  VALUES (14, 15, 2, 6, 3, 10, 0, 1);
INSERT INTO Athlete_Match  VALUES (14, 14, 39, 2, 0, 5, 6, 8);
INSERT INTO Athlete_Match  VALUES (14, 18, 15, 7, 3, 10, 3, 10);

INSERT INTO Athlete_Match  VALUES (15, 14, 26, 9, 11, 7, 1, 0);
INSERT INTO Athlete_Match  VALUES (15, 15, 16, 22, 9, 0, 5, 3);
INSERT INTO Athlete_Match  VALUES (15, 12, 9, 1, 15, 9, 2, 3);
INSERT INTO Athlete_Match  VALUES (15, 22, 0, 11, 11, 0, 3, 9);
INSERT INTO Athlete_Match  VALUES (15, 11, 29, 2, 8, 5, 7, 2);
INSERT INTO Athlete_Match  VALUES (15, 23, 10, 15, 7, 9, 3, 11);
INSERT INTO Athlete_Match  VALUES (15, 24, 29, 17, 12, 2, 1, 2);
INSERT INTO Athlete_Match  VALUES (15, 13, 19, 4, 10, 4, 0, 3);
INSERT INTO Athlete_Match  VALUES (15, 25, 21, 3, 2, 3, 6, 6);
INSERT INTO Athlete_Match  VALUES (15, 21, 1, 1, 10, 9, 5, 7);

INSERT INTO Athlete_Match  VALUES (16, 12, 36, 14, 15, 6, 1, 8);
INSERT INTO Athlete_Match  VALUES (16, 13, 9, 12, 3, 5, 2, 7);
INSERT INTO Athlete_Match  VALUES (16, 14, 28, 15, 6, 9, 8, 8);
INSERT INTO Athlete_Match  VALUES (16, 30, 28, 9, 4, 4, 6, 3);
INSERT INTO Athlete_Match  VALUES (16, 11, 40, 5, 1, 5, 6, 4);
INSERT INTO Athlete_Match  VALUES (16, 15, 24, 13, 6, 3, 5, 5);
INSERT INTO Athlete_Match  VALUES (16, 26, 31, 2, 4, 0, 6, 11);
INSERT INTO Athlete_Match  VALUES (16, 29, 35, 16, 13, 7, 6, 2);
INSERT INTO Athlete_Match  VALUES (16, 28, 2, 19, 10, 4, 8, 3);
INSERT INTO Athlete_Match  VALUES (16, 27, 24, 16, 10, 4, 1, 6);

INSERT INTO Athlete_Match  VALUES (17, 11, 29, 21, 9, 9, 2, 6);
INSERT INTO Athlete_Match  VALUES (17, 12, 17, 13, 6, 7, 0, 1);
INSERT INTO Athlete_Match  VALUES (17, 35, 1, 22, 5, 10, 3, 10);
INSERT INTO Athlete_Match  VALUES (17, 13, 5, 15, 6, 6, 2, 11);
INSERT INTO Athlete_Match  VALUES (17, 31, 26, 18, 13, 1, 8, 8);
INSERT INTO Athlete_Match  VALUES (17, 34, 29, 10, 8, 4, 0, 2);
INSERT INTO Athlete_Match  VALUES (17, 14, 8, 10, 0, 5, 4, 7);
INSERT INTO Athlete_Match  VALUES (17, 32, 9, 1, 4, 1, 5, 3);
INSERT INTO Athlete_Match  VALUES (17, 15, 31, 3, 12, 6, 4, 10);
INSERT INTO Athlete_Match  VALUES (17, 32, 28, 12, 4, 3, 8, 11);

INSERT INTO Athlete_Match  VALUES (18, 28, 29, 8, 2, 5, 8, 6);
INSERT INTO Athlete_Match  VALUES (18, 18, 1, 8, 0, 10, 4, 5);
INSERT INTO Athlete_Match  VALUES (18, 17, 2, 12, 4, 6, 6, 7);
INSERT INTO Athlete_Match  VALUES (18, 16, 36, 5, 15, 7, 4, 6);
INSERT INTO Athlete_Match  VALUES (18, 29, 7, 13, 5, 1, 8, 3);
INSERT INTO Athlete_Match  VALUES (18, 20, 2, 0, 12, 9, 4, 5);
INSERT INTO Athlete_Match  VALUES (18, 26, 29, 3, 6, 7, 5, 1);
INSERT INTO Athlete_Match  VALUES (18, 27, 40, 20, 12, 10, 3, 7);
INSERT INTO Athlete_Match  VALUES (18, 19, 26, 22, 2, 4, 5, 0);
INSERT INTO Athlete_Match  VALUES (18, 30, 10, 3, 11, 1, 3, 8);

INSERT INTO Athlete_Match  VALUES (19, 18, 16, 4, 2, 4, 0, 3);
INSERT INTO Athlete_Match  VALUES (19, 19, 31, 0, 13, 9, 6, 11);
INSERT INTO Athlete_Match  VALUES (19, 17, 5, 5, 13, 3, 6, 6);
INSERT INTO Athlete_Match  VALUES (19, 16, 30, 15, 3, 5, 8, 5);
INSERT INTO Athlete_Match  VALUES (19, 34, 36, 17, 6, 3, 8, 11);
INSERT INTO Athlete_Match  VALUES (19, 32, 31, 20, 6, 5, 0, 0);
INSERT INTO Athlete_Match  VALUES (19, 35, 20, 10, 2, 6, 2, 4);
INSERT INTO Athlete_Match  VALUES (19, 20, 16, 14, 1, 5, 7, 2);
INSERT INTO Athlete_Match  VALUES (19, 31, 7, 0, 9, 10, 1, 4);
INSERT INTO Athlete_Match  VALUES (19, 33, 23, 22, 14, 6, 4, 3);

INSERT INTO Athlete_Match  VALUES (20, 21, 6, 20, 8, 8, 0, 6);
INSERT INTO Athlete_Match  VALUES (20, 33, 31, 1, 13, 10, 2, 7);
INSERT INTO Athlete_Match  VALUES (20, 25, 26, 7, 0, 2, 2, 6);
INSERT INTO Athlete_Match  VALUES (20, 31, 33, 17, 2, 0, 7, 11);
INSERT INTO Athlete_Match  VALUES (20, 34, 39, 21, 0, 8, 4, 10);
INSERT INTO Athlete_Match  VALUES (20, 24, 18, 2, 8, 5, 3, 9);
INSERT INTO Athlete_Match  VALUES (20, 23, 30, 16, 0, 1, 1, 3);
INSERT INTO Athlete_Match  VALUES (20, 22, 3, 12, 12, 5, 1, 9);
INSERT INTO Athlete_Match  VALUES (20, 32, 37, 20, 5, 5, 7, 3);
INSERT INTO Athlete_Match  VALUES (20, 35, 19, 1, 11, 4, 4, 12);

INSERT INTO Athlete_Match  VALUES (21, 24, 26, 9, 15, 7, 6, 4);
INSERT INTO Athlete_Match  VALUES (21, 25, 2, 22, 5, 8, 8, 5);
INSERT INTO Athlete_Match  VALUES (21, 30, 39, 0, 1, 0, 0, 8);
INSERT INTO Athlete_Match  VALUES (21, 21, 13, 22, 7, 10, 5, 6);
INSERT INTO Athlete_Match  VALUES (21, 22, 20, 20, 1, 7, 7, 1);
INSERT INTO Athlete_Match  VALUES (21, 23, 7, 20, 10, 7, 8, 6);
INSERT INTO Athlete_Match  VALUES (21, 29, 16, 1, 15, 0, 5, 0);
INSERT INTO Athlete_Match  VALUES (21, 26, 35, 5, 6, 9, 8, 11);
INSERT INTO Athlete_Match  VALUES (21, 27, 12, 13, 3, 8, 3, 8);
INSERT INTO Athlete_Match  VALUES (21, 28, 24, 15, 10, 1, 3, 11);
