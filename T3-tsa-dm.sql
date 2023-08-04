/******PLEASE ENTER YOUR DETAILS BELOW******/
/*T3-tsa-dm.sql*/


/* Comments for your marker:




*/

/*-**This command shows the outputs of triggers**---*/
/*-**Run the command before running the insert statements.**---*/
/*-**Do not remove**---*/
SET SERVEROUTPUT ON
/*-**end**---*/

/*3(a)*/

DROP SEQUENCE booking_seq;

CREATE SEQUENCE booking_seq START WITH 100 INCREMENT BY 10;



/*3(b)*/


INSERT INTO cabin VALUES (
    (
        SELECT
            resort_id
        FROM
                 resort
            NATURAL JOIN town
        WHERE
                upper(resort_name) = upper('Awesome Resort')
            AND upper(town_lat) = - 17.9644
            AND upper(town_long) = 122.2304
            AND upper(town_name) = upper('Broome')
    ),
    4,
    4,
    10,
    'I',
    220,
    'The cabin has 4 bedroom, an outside common bathroom.'
);

COMMIT;



/*3(c)*/


INSERT INTO booking VALUES (
    booking_seq.NEXTVAL,
    (
        SELECT
            resort_id
        FROM
                 resort
            NATURAL JOIN town
        WHERE
                upper(resort_name) = upper('Awesome Resort')
            AND upper(town_lat) = - 17.9644
            AND upper(town_long) = 122.2304
            AND upper(town_name) = upper('Broome')
    ),
    4,
    TO_DATE('26/05/2023', 'dd/mm/yyyy'),
    TO_DATE('28/05/2023', 'dd/mm/yyyy'),
    4,
    4,
    ( TO_DATE('28/05/2023', 'dd/mm/yyyy') - TO_DATE('26/05/2023', 'dd/mm/yyyy') ) * 220
    ,
    (
        SELECT
            member_id
        FROM
            member
        WHERE
                upper(resort_id) = 9
            AND upper(member_no) = 2
            AND upper(member_gname) = upper('Noah')
            AND upper(member_fname) = upper('Garrard')
    ),
    (
        SELECT
            staff_id
        FROM
            staff
        WHERE
                upper(staff_phone) = '0493427245'
            AND upper(staff_gname) = upper('Reeba')
            AND upper(staff_fname) = upper('Wildman')
    )
);

COMMIT;


/*3(d)*/

UPDATE booking
SET
    booking_to = TO_DATE('29/05/2023', 'dd/mm/yyyy'),
    booking_total_points_cost = ( TO_DATE('29/05/2023', 'dd/mm/yyyy') - TO_DATE('26/05/2023'
    , 'dd/mm/yyyy') ) * 220
WHERE
        upper(resort_id) = (
            SELECT
                resort_id
            FROM
                     resort
                NATURAL JOIN town
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND upper(town_lat) = - 17.9644
                AND upper(town_long) = 122.2304
                AND upper(town_name) = upper('Broome')
        )
    AND upper(booking_from) = TO_DATE('26/05/2023', 'dd/mm/yyyy')
    AND upper(member_id) = (
        SELECT
            member_id
        FROM
            member
        WHERE
                upper(resort_id) = 9
            AND upper(member_no) = 2
            AND upper(member_gname) = upper('Noah')
            AND upper(member_fname) = upper('Garrard')
    )
    AND upper(cabin_no) = 4;

COMMIT;

/*3(e)*/

DELETE FROM booking
WHERE
        upper(resort_id) = (
            SELECT
                resort_id
            FROM
                     resort
                NATURAL JOIN town
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND upper(town_lat) = - 17.9644
                AND upper(town_long) = 122.2304
                AND upper(town_name) = upper('Broome')
        )
    AND upper(member_id) = (
        SELECT
            member_id
        FROM
            member
        WHERE
                upper(resort_id) = 9
            AND upper(member_no) = 2
            AND upper(member_gname) = upper('Noah')
            AND upper(member_fname) = upper('Garrard')
    )
    AND upper(cabin_no) = 4;

DELETE FROM cabin
WHERE
        upper(resort_id) = (
            SELECT
                resort_id
            FROM
                     resort
                NATURAL JOIN town
            WHERE
                    upper(resort_name) = upper('Awesome Resort')
                AND upper(town_lat) = - 17.9644
                AND upper(town_long) = 122.2304
                AND upper(town_name) = upper('Broome')
        )
    AND upper(cabin_no) = 4
    AND upper(cabin_nobedrooms) = 4
    AND upper(cabin_sleeping_capacity) = 10
    AND upper(cabin_points_cost_day) = 220;

COMMIT;