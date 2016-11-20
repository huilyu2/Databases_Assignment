SELECT DISTINCT FIRSTNAME, LASTNAME, A9_VISITOR.TYPE
FROM A9_VISITOR
     JOIN A9_VISITS ON A9_VISITOR.IDENTIFIER = A9_VISITS.IDENTIFIER
     JOIN A9_EXHIBITION ON A9_VISITS.EXHIBITIONNAME = A9_EXHIBITION.EXHIBITIONNAME
WHERE A9_EXHIBITION.TYPE = 'Temporary Exhibition';

SELECT A9_MOVIE_AWARD.MOVIETITLE, PRICE, CAPACITY, COUNT(AWARD)
FROM A9_SCI_FI_MOVIE, A9_MOVIE_AWARD, A9_MUSEUM_CINEMA
WHERE A9_MOVIE_AWARD.MOVIETITLE = A9_SCI_FI_MOVIE.MOVIETITLE
      AND A9_SCI_FI_MOVIE.CINEMANAME = A9_MUSEUM_CINEMA.CINEMANAME
GROUP BY A9_MOVIE_AWARD.MOVIETITLE, PRICE, CAPACITY
HAVING COUNT(AWARD)>2;

SELECT OBJECTNAME, LOCATION, EXHIBITDATE
FROM A9_OBJECT, A9_EXHIBITION, A9_DISPLAYS
WHERE A9_OBJECT.OBJECTID = A9_DISPLAYS.OBJECTID
      AND A9_DISPLAYS.EXHIBITIONNAME = A9_EXHIBITION.EXHIBITIONNAME
      AND USINGCONDITION = 'new'
ORDER BY EXHIBITDATE DESC;

SELECT BIRTHDATE, A9_CHILDREN_PARK.PARKNAME, THEME, PARTICIPATETIME
FROM A9_VISITOR 
     JOIN A9_PARTICIPATES_IN ON A9_VISITOR.IDENTIFIER = A9_PARTICIPATES_IN.IDENTIFIER
     JOIN A9_CHILDREN_PARK ON A9_CHILDREN_PARK.PARKNAME = A9_PARTICIPATES_IN.PARKNAME
ORDER BY PARTICIPATETIME;

SELECT PRESENTER, A9_ACTIVITY.ACTIVITYNAME
FROM A9_ACTIVITY, A9_CHILDREN_PARK, A9_HOLDS
WHERE A9_ACTIVITY.ACTIVITYNAME = A9_HOLDS.ACTIVITYNAME
      AND A9_HOLDS.PARKNAME = A9_CHILDREN_PARK.PARKNAME
      AND LOCATION = '1st Floor Southeast Rm 106';
