## Progression

-- 1. **Write a query to display the team details. Display the records sorted in the order of team name.**
SELECT * FROM TEAM ORDER BY NAME;

-- 2. **Write a query to display the player details whose name starts with a letter `S` and who do not belong to the country 'South Africa'. Display the records sorted in descending order based on player name.**
SELECT * FROM PLAYER WHERE NAME LIKE 'S%' AND  COUNTRY!= 'South Africa' ORDER BY NAME DESC

-- 3. **Write a query to display the event number and the seconds taken for each event. Display the records sorted in ascending order based on event number.**
SELECT EVENT_NO, CLOCK_IN_SECONDS from event order by EVENT_NO ASC

-- 4. **Write a query to display the event numbers of those events which has sum of raid points and defending points greater than or equal to 3. Display the records sorted in ascending order based on event_no.**
SELECT EVENT_NO FROM EVENT WHERE SUM(RAID_POINTS) > = 3 AND SUM(DEFENDING_POINTS) > = 3 ORDER BY ASC

-- 5. **Write a query to display the name of all the players who belong to the country India or Iran. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER WHERE COUNTRY = 'INDIA' OR Country ='IRAN' ORDER BY NAME ASC

-- 6. **Write a query to display the name of all the players who does not belong to the country India and Iran. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER WHERE COUNTRY!='INDIA' OR COUNTRY!='IRAN' ORDER BY NAME ASC

-- 7. **Write a query to display the names of all the skills that start with `Defend`. Display the records sorted in ascending order based on skill name.**
CREATE TABLE SKILLS 
(
ID INT,
NAMES VARCHAR(10)
);
INSERT INTO SKILLS VALUES(1,'DEFENDTRY');
INSERT INTO SKILLS VALUES(1,'GOOD');
INSERT INTO SKILLS VALUES(1,'DEFENDTEST');
INSERT INTO SKILLS VALUES(1,'DISPLAY');

SELECT NAMES FROM SKILLS WHERE NAMES LIKE 'DEFEND%' ORDER BY NAMES ASC

-- 8. **Write a query to display all the stadium names that ends with `Complex`. Display the records sorted in ascending order based on stadium names.**
create table STADIUM 
(
ID INT,
STADIUM_NAMES VARCHAR(10)
);
INSERT INTO Stadium VALUES(1,'DECOMPLEX');
INSERT INTO Stadium VALUES(2,'BIOCOMPLEX');
INSERT INTO Stadium VALUES(3,'HYPERCOMPLEX ');
INSERT INTO Stadium VALUES(4,'GOOD');
INSERT INTO Stadium VALUES(5,'WORD');
INSERT INTO Stadium VALUES(6,'COMPLEX SENTENCES');
SELECT STADIUMNAMES FROM STADIUM WHERE STADIUMNAMES LIKE '%COMPLEX' ORDER BY STADIUMNAMES ASC

-- 9. **Write a query to display the winner team ids and the scores of those teams whose scores are less than 35. Display the records sorted in descending order based on outcome id.**
SELECT WINNER_TEAM_ID, SCORE FROM OUTCOME WHERE SCORE <35 ORDER BY ID DESC

-- 10. **Write a query to display the game details of those games that were played between January and March of 2020. Display the records sorted in descending order based on id.**
SELECT * FROM GAME WHERE GAME_DATE BETWEEN TO_DATE ( '2020-01-14', ' YYYY-MM-DD') AND TO_DATE ('2020-03-01','YYYY-MM-DD')  ORDER BY ID DESC

-- 11. **Write a query to display the names of players who are Raiders. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER
WHERE ID IN(SELECT RAIDER_ID FROM EVENT) ORDER BY NAME ASC;

-- 12. **WRITE A QUERY TO DISPLAY THE EVENT NUMBER, RAID POINTS AND DEFENCE POINTS SCORED IN THE FIRST INNINGS OF THE GAME THAT WAS PLAYED ON `2020-01-26`. DISPLAY THE RECORDS SORTED IN ASCENDING ORDER BASED ON EVENT NUMBER.**
SELECT EVENT_NO, RAID_POINTS,DEFENDING_POINTS FROM EVENT WHERE ID IN (SELECT FIRST_INNINGS_ID FROM GAME WHERE GAME_DATE='26/JAN/2020') ORDER BY EVENT_NO ASC;

-- 13. **Write a query to display the name of the winner team in the game played on `2020-03-09`. Display the records sorted in ascending order based on team name.**
SELECT NAME FROM TEAM WHERE ID IN(SELECT WINNER_TEAM_ID FROM OUTCOME WHERE ID IN(SELECT ID FROM GAME WHERE GAME_DATE='09/MAR/2020'))ORDER BY NAME ASC;

-- 14. **Write a query to display the names of players who were the player of the match in the game played on 2020-03-09'. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER WHERE ID IN(SELECT PLAYER_OF_MATCH FROM OUTCOME WHERE ID IN(SELECT ID FROM GAME WHERE GAME_DATE='09/MAR/2020'))ORDER BY ID DESC;

-- 15. **Write a query to display the names of players who are All rounders. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER WHERE SKILL_ID IN(SELECT NAME FROM SKILL WHERE NAME='ALL ROUNDER') ORDER BY NAME ASC;

-- 16. **Write a query to display the venue names for all the games that were played on `2020-03-09`. Display the records sorted in ascending order based on venue name.**
ALTER TABLE VENUE
ADD VENUEDATE DATE
UPDATE VENUE SET VENUEDATE=TO_DATE ( '2020-03-09', ' YYYY-MM-DD') WHERE ID=59
SELECT * FROM VENUE
SELECT STADIUM_NAME FROM VENUE WHERE VENUEDATE=TO_DATE ( '2020-03-09', ' YYYY-MM-DD')

-- 17. **Write a query to display the Coach's name of the team `Iran`**
INSERT INTO TEAM VALUES(2,'TEST','IRAN',7)
SELECT * FROM TEAM WHERE COACH = 'IRAN'

-- 18. **Write a query to display the event number and the defence points of `Fazel Atrachali` in each event. Display the records sorted in ascending order based on event number.**
SELECT * FROM EVENT
ALTER TABLE EVENT
ADD  NAME VARCHAR(10)
UPDATE EVENT SET NAME='FAZEL ATRACHALI' WHERE ID=15
SELECT  EVENT_NO, DEFENDING_POINTS FROM EVENT WHERE NAME='FAZEL ATRACHALI' ORDER BY  EVENT_NO ASC;

-- 19. **Write a query to display the names of the Winning teams in the month of March 2020. Display the records sorted in ascending order based on team name.**
INSERT INTO GAME VALUES(22,TO_DATE ( '2020-03-1','YYYY-MM-DD'),20,19,12,44,40,35,12,9);
SELECT NAME FROM PLAYER
WHERE ID IN(SELECT WINNER_TEAM_ID FROM OUTCOME WHERE ID IN(SELECT ID FROM GAME WHERE GAME_DATE='1/MAR/2020')) ORDER BY NAME ASC;

-- 20. **Write a query to display the names of players who were the player of the match in the games held in March 2020. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER,OUTCOME,GAME WHERE GAME_DATE BETWEEN TO_DATE('01-MAR-2020', 'DD-MM-YYYY') AND '20-MAR-2020' ORDER BY NAME ASC;
