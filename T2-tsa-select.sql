/******PLEASE ENTER YOUR DETAILS BELOW******/
/*T2-tsa-select.sql*/


/* Comments for your marker:




*/

/*2(a)*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/

SELECT
    town_id,
    town_name,
    poi_type_id,
    poi_type_descr,
    COUNT(poi_type_id) AS poi_count
FROM
         tsa.town
    NATURAL JOIN tsa.point_of_interest
    NATURAL JOIN tsa.poi_type
GROUP BY
    town_id,
    town_name,
    poi_type_id,
    poi_type_descr
HAVING
    COUNT(poi_type_id) > 1
ORDER BY
    town_id,
    poi_type_descr;


/*2(b)*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/

SELECT
    m1.member_id,
    m1.member_gname
    || ' '
    || m1.member_fname        AS member_name,
    m1.resort_id,
    r.resort_name,
    COUNT(m2.member_id_recby) AS number_of_recommendations
FROM
         tsa.member m1
    JOIN tsa.member m2
    ON m1.member_id = m2.member_id_recby
    JOIN tsa.resort r
    ON m2.resort_id = r.resort_id
GROUP BY
    m1.member_id,
    m1.member_gname
    || ' '
    || m1.member_fname,
    m1.resort_id,
    r.resort_name,
    m2.member_id_recby
HAVING
    COUNT(m2.member_id_recby) = (
        SELECT
            MAX(COUNT(member_id_recby))
        FROM
            tsa.member
        WHERE
            upper(member_id_recby) IS NOT NULL
        GROUP BY
            member_id_recby
    )
ORDER BY
    m1.resort_id,
    m1.member_id;

/*2(c)*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/


SELECT
    poi_id,
    poi_name,
    CASE
        WHEN MAX(poi_review_rating) IS NULL THEN
            'NR'
        ELSE
            to_char(MAX(poi_review_rating),
                    '0')
    END AS max_rating,
    CASE
        WHEN MIN(poi_review_rating) IS NULL THEN
            'NR'
        ELSE
            to_char(MIN(poi_review_rating),
                    '0')
    END AS min_rating,
    CASE
        WHEN AVG(poi_review_rating) IS NULL THEN
            'NR'
        ELSE
            to_char(AVG(poi_review_rating),
                    '0.0')
    END AS avg_rating
FROM
    tsa.point_of_interest
GROUP BY
    poi_id,
    poi_name,
    poi_review_rating,
    poi_review_rating,
    poi_review_rating
ORDER BY
    poi_id;


/*2(d)*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/


SELECT
    poi_name,
    poi_type_descr,
    town_name,
    lpad('Lat: '
         || to_char(town_lat, '90.999000')
         || ' '
         || 'Long: '
         || to_char(town_long, '990.999000'),
         35,
         ' ')            AS town_location,
    COUNT(review_rating) AS reviews_completed,
    CASE
        WHEN COUNT(review_rating) = 0 THEN
            'No reviews completed'
        ELSE
            to_char((COUNT(review_rating)) /(
                SELECT
                    COUNT(review_rating)
                FROM
                    tsa.review
            ) * 100,
                    '90.99')
            || '%'
    END                  AS percent_of_reviews
FROM
         tsa.review
    NATURAL JOIN tsa.point_of_interest
    NATURAL JOIN tsa.poi_type
    NATURAL JOIN tsa.town
GROUP BY
    poi_name,
    poi_type_descr,
    town_name,
    town_lat,
    town_long,
    review_rating
ORDER BY
    town_name,
    COUNT(review_rating) DESC,
    poi_name;


/*2(e)*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/

SELECT
    m.resort_id,
    r.resort_name,
    m.member_no,
    m.member_gname
    || ' '
    || m.member_fname                            AS member_name,
    to_char(m.member_date_joined, 'dd-Mon-yyyy') AS date_joined,
    rpad(m2.member_id
         || ' '
         || m2.member_gname
         || ' '
         || m2.member_fname, 25, ' ')                 AS recommended_by_details,
    lpad('$'
         || round(SUM(mc.mc_total),
                  0),
         13,
         ' ')                                    AS total_charges
FROM
         tsa.member m
    JOIN tsa.resort        r
    ON m.resort_id = r.resort_id
    JOIN tsa.town          t
    ON t.town_id = r.town_id
    JOIN tsa.member_charge mc
    ON mc.member_id = m.member_id
    JOIN tsa.member        m2
    ON m.member_id_recby = m2.member_id
WHERE
    t.town_id NOT IN (
        SELECT
            town_id
        FROM
            tsa.town
        WHERE
            upper(town_name) LIKE upper('%Byron Bay%')
            AND upper(town_state) LIKE upper('%NSW%')
    )
    AND m.member_id_recby IS NOT NULL
GROUP BY
    m.resort_id,
    r.resort_name,
    m.member_no,
    m.member_gname
    || ' '
    || m.member_fname,
    m.member_date_joined,
    m2.member_id
    || ' '
    || m2.member_gname
    || ' '
    || m2.member_fname
HAVING
    m.member_gname
    || ' '
    || m.member_fname IN (
        SELECT
            temp2.name
        FROM
                 (
                SELECT
                    ms.resort_id, AVG(mcs.mc_total) AS avgtotal
                FROM
                         tsa.member_charge mcs
                    JOIN tsa.member ms
                    ON ms.member_id = mcs.member_id
                GROUP BY
                    ms.resort_id
            ) temp
            JOIN (
                SELECT
                    ms2.resort_id, ms2.member_gname
                                   || ' '
                                   || ms2.member_fname AS name, SUM(mcs2.mc_total)  AS
                                   memtotal
                FROM
                         tsa.member_charge mcs2
                    JOIN tsa.member ms2
                    ON ms2.member_id = mcs2.member_id
                GROUP BY
                    ms2.member_gname
                    || ' '
                    || ms2.member_fname, ms2.resort_id,
                    ms2.member_id
            ) temp2
            ON temp.resort_id = temp2.resort_id
        WHERE
            upper(temp.avgtotal) > upper(temp2.memtotal)
    )
ORDER BY
    m.resort_id,
    m.member_no;



/*2(f)*/
/* PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE*/
/* ENSURE that your query is formatted and has a semicolon*/
/* (;) at the end of this answer*/



SELECT
    res_loc.resort_id,
    res_loc.resort_name,
    poi_loc.poi_name,
    poi_loc.poi_town,
    poi_loc.poi_state,
    poi_loc.poi_openning_time,
    to_char(round(geodistance(res_loc.resort_lat, res_loc.resort_long, poi_loc.poi_lat
    , poi_loc.poi_long),
                  1),
            '990.9')
    || ' '
    || 'Kms' AS distance
FROM
         (
        SELECT
            p.poi_id,
            p.poi_name,
            t.town_name  AS poi_town,
            t.town_state AS poi_state,
            CASE
                WHEN to_char(p.poi_open_time, 'HH:MM') IS NULL THEN
                    'Not Applicable'
                WHEN TO_NUMBER(to_char(p.poi_open_time, 'HH24')) >= 12 THEN
                    to_char(p.poi_open_time, 'HH:MM')
                    || ' '
                    || 'PM'
                ELSE
                    to_char(p.poi_open_time, 'HH:MM')
                    || ' '
                    || 'AM'
            END          AS poi_openning_time,
            t.town_lat   AS poi_lat,
            t.town_long  AS poi_long,
            town_id
        FROM
                 tsa.point_of_interest p
            NATURAL JOIN tsa.town t
        ORDER BY
            t.town_name
    ) poi_loc
    JOIN (
        SELECT
            t.town_lat  AS resort_lat,
            t.town_long AS resort_long,
            resort_id,
            resort_name,
            town_id
        FROM
                 tsa.resort r
            NATURAL JOIN tsa.town t
        ORDER BY
            t.town_name
    ) res_loc
    ON geodistance(res_loc.resort_lat, res_loc.resort_long, poi_loc.poi_lat, poi_loc.poi_long
    ) <= 100
ORDER BY
    resort_name,
    distance;

