-- This command file loads an experimental person database.
-- The data conforms to the following assumptions:
--     * People can have 0 or many team assignments.
--     * People can have 0 or many visit dates.
--     * Teams and visits don't affect one another.
--
-- CS 342, Spring, 2017
-- kvlinden

DROP TABLE PersonTeam;
DROP TABLE PersonVisit;

CREATE TABLE PersonTeam (
	personName varchar(10),
    teamName varchar(10)
	);

CREATE TABLE PersonVisit (
	personName varchar(10),
    personVisit date
	);

-- Load records for two team memberships and two visits for Shamkant.
INSERT INTO PersonTeam VALUES ('Shamkant', 'elders');
INSERT INTO PersonTeam VALUES ('Shamkant', 'executive');
INSERT INTO PersonVisit VALUES ('Shamkant', '22-FEB-2015');
INSERT INTO PersonVisit VALUES ('Shamkant', '1-MAR-2015');

-- Query a combined "view" of the data of the form View(name, team, visit).
SELECT pt.personName, pt.teamName, pv.personVisit
FROM PersonTeam pt, PersonVisit pv
WHERE pt.personName = pv.personName;

-- Exercise 4.2
-- a.
-- There are no functional dependencies in either the PersonTeam or the PersonVisit tables.
--		A given person can be on multiple teams and a team can have multiple people
--		so neither personName functionally depends teamName nor teamName functionally depends
--		personName. Also, a given person can visit a church multiple times so neither personName
--		functionally depends personVisit nor personVisit functionally depends personName. This
--		means that both relations are in BCNF form because there are no functional dependencies whose
--		left hand side is not a superkey.
-- There are also no multivalued dependencies in either the PersonTeam or the PersonVisit tables.
--		There are no situations where one attribute depends on another with respect to a third attribute
--		because there are only two attributes in each table. So there are no multivalued dependencies
--		where the left hand side is not a superkey, meaning both tables are in 4NF.

-- b.
-- The output of the combined "view" query, when taken as a single relation, is in BCNF. Again, for
--		BCNF, all functional dependencies must have the left hand side be a superkey. There are actually
--		no functional dependencies in this single relation because no attribute functionally depends
--		on another attribute, e.g. personName does not determine teamName or personVisit.
-- However, the output of this single relation is NOT in 4NF. To be in 4NF, every multivalued dependency
--		left hand side must be a superkey of the relation. There is a multivalued dependency of personName ->>
--		teamName | personVisit. However, personName alone is not a superkey. The superkey for this relation is
--		personName, teamName, personVisit all together. Because that one multivalued dependency violates the left
--		hand side condition, this combined "view" single relation is not in 4NF.

-- c.
-- Just because the original schema and the derived "view" have the same number of records does not
--		mean they are equally appropriate. The single "view" relation needs to have every combination of records
--		to make up all the data/information for that relation. I think yes, it may depend on the context; if you
--		want all the data to appear in a single table every time, then this single relation view would be best. But
--		that must take into consideration that single relation is not in 4NF form, if one desired to conform to that
--		kind of normal form.
