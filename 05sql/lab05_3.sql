-- Lab05_3.sql
-- Ethan Clark
-- CS 342 - Homework05

-- a. Produce an appropriate phone-book entry for "traditional" family entries
SELECT Ph.lastName || ', ' || Ph.firstName || ' and ' || Pw.firstName || ' - ' ||  H.phoneNumber || ' - ' || H.street AS Phone_Book_Entry
FROM Person Ph, Person Pw, HouseHold H
WHERE Ph.householdID = H.ID AND Pw.householdID = H.ID
AND Ph.householdRole = 'husband' AND Pw.householdRole = 'wife'
AND Ph.lastName = Pw.lastName;

-- b. Extend your solution to handle families in which both spouses keep their own names.
SELECT Ph.lastName || ', ' || Ph.firstName || ' and ' || Pw.firstName || ' - ' ||  H.phoneNumber || ' - ' || H.street
FROM Person Ph, Person Pw, HouseHold H
WHERE Ph.householdID = H.ID AND Pw.householdID = H.ID
AND Ph.householdRole = 'husband' AND Pw.householdRole = 'wife'
AND Ph.lastName = Pw.lastName
UNION
SELECT Ph.lastName || ', ' || Ph.firstName || ' and ' || Pw.firstName || ' ' || Pw.lastName || ' - ' ||  H.phoneNumber || ' - ' || H.street
FROM Person Ph, Person Pw, HouseHold H
WHERE Ph.householdID = H.ID AND Pw.householdID = H.ID
AND Ph.householdRole = 'husband' AND Pw.householdRole = 'wife'
AND Ph.lastName <> Pw.lastName;

-- c. Finally, extend your solution to include single-adult families
SELECT Ph.lastName || ', ' || Ph.firstName || ' and ' || Pw.firstName || ' - ' ||  H.phoneNumber || ' - ' || H.street AS Phone_Book_Entry
FROM Person Ph, Person Pw, HouseHold H
WHERE Ph.householdID = H.ID AND Pw.householdID = H.ID
AND Ph.householdRole = 'husband' AND Pw.householdRole = 'wife'
AND Ph.lastName = Pw.lastName
UNION
SELECT Ph.lastName || ', ' || Ph.firstName || ' and ' || Pw.firstName || ' ' || Pw.lastName || ' - ' ||  H.phoneNumber || ' - ' || H.street AS Phone_Book_Entry
FROM Person Ph, Person Pw, HouseHold H
WHERE Ph.householdID = H.ID AND Pw.householdID = H.ID
AND Ph.householdRole = 'husband' AND Pw.householdRole = 'wife'
AND Ph.lastName <> Pw.lastName
UNION
SELECT P.lastName || ', ' || P.firstName || ' - ' ||  H.phoneNumber || ' - ' || H.street AS Phone_Book_Entry
FROM Person P, HouseHold H
WHERE P.householdID = H.ID AND P.householdRole = 'single';