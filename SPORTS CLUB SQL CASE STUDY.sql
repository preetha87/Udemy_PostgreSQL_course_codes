/*SPORTS CLUB CASE STUDY*/
/*Q1: How can you retrieve all the information from the cd.facilities table?*/

SELECT *
FROM cd.facilities;

/*Q2: You want to print out a list of all of the facilities and their cost to members. 
How would you retrieve a list of only facility names and costs?*/

SELECT name AS facility_name, membercost AS cost_to_members
FROM cd.facilities;

/*Q3: How can you produce a list of facilities that charge a fee to members?*/

SELECT name AS facility_name
FROM cd.facilities
WHERE membercost > 0;

/*Q4: How can you produce a list of facilities that charge a fee to members, and that fee is less than 
1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.*/

SELECT facid, name AS facility_name, membercost AS member_cost, monthlymaintenance AS monthly_maintenance
FROM cd.facilities
WHERE membercost > 0 AND membercost < (0.02 * monthlymaintenance);


/*Q5: How can you produce a list of all facilities with the word 'Tennis' in their name?*/

SELECT *
FROM cd.facilities
WHERE name ILIKE '%Tennis%';

/*Q6: How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.*/

SELECT facid AS facility_id, name AS facility_name, membercost AS cost_to_members, guestcost AS cost_to_guests
FROM cd.facilities
WHERE facid IN(1,5);

/*Q7 : How can you produce a list of members who joined after the start of September 2012?
Return the memid, surname, firstname, and joindate of the members in question.*/

SELECT memid AS member_id, firstname AS first_name, surname, joindate
FROM cd.members
WHERE joindate > '2012-09-01';

/*Q8: How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.*/

SELECT DISTINCT surname
FROM cd.members
ORDER BY surname
LIMIT 10;

/*Q9: You'd like to get the signup date of your last member. How can you retrieve this information?*/

SELECT joindate AS sign_up_date
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

/*Q10. Produce a count of the number of facilities that have a cost to guests of 10 or more.*/

SELECT COUNT(name)
FROM cd.facilities
WHERE guestcost >=10;

/*Q11. Produce a count of the number of recommendations each member has made. Order by member ID.

SELECT COUNT(*), recommendedby
FROM cd.members
WHERE recommendedby IS NOT NULL
GROUP BY recommendedby
ORDER BY recommendedby;

/*Q.12 Produce a list of the total number of slots booked per facility in the month of September 2012. 
Produce an output table consisting of facility id and slots, sorted by the number of slots.*/

SELECT facid, SUM(slots)
FROM cd.bookings
WHERE extract(month from starttime) = 09
GROUP BY facid
ORDER BY SUM(slots);

/*Q13. Produce a list of facilities with more than 1000 slots booked. 
Produce an output table consisting of facility id and total slots, sorted by facility id.*/

SELECT facid, SUM(slots)
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots)>1000
ORDER BY facid;

/*Q14. How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? 
Return a list of start time and facility name pairings, ordered by the time.*/
 
SELECT starttime, name AS facility_name
FROM cd.bookings
INNER JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
WHERE extract(month from starttime) = 09 AND extract(day from starttime) = 21 AND name ILIKE '%Tennis Court%'
ORDER BY extract(hour from starttime) || ' : ' || extract(minute from starttime);
