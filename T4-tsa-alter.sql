/******PLEASE ENTER YOUR DETAILS BELOW******/
/*T4-tsa-alter.sql*/

/* Comments for your marker:
4b: staff_role_id can't be null since "Each staff member has one assigned role"
    and even the staff just become employee they still have a role.



*/

/*4(a)*/

ALTER TABLE cabin ADD cabin_book_count NUMERIC(5) DEFAULT 0 NOT NULL;

COMMENT ON COLUMN cabin.cabin_book_count IS
    'total number of bookings for each cabin';

UPDATE cabin
SET
    cabin_book_count = (
        SELECT
            COUNT(*)
        FROM
            booking b
        WHERE
                b.resort_id = cabin.resort_id
            AND b.cabin_no = cabin.cabin_no
    )
WHERE
    cabin_no IN (
        SELECT
            c.cabin_no
        FROM
            cabin   c
            LEFT OUTER JOIN booking b
            ON c.resort_id = b.resort_id
        WHERE
            b.cabin_no IS NOT NULL
        GROUP BY
            c.cabin_no
    );

COMMIT;

SELECT
    resort_id,
    cabin_no,
    cabin_book_count
FROM
    cabin
ORDER BY
    resort_id,
    cabin_no;

DESC cabin;

/*4(b)*/

DROP TABLE staff_role CASCADE CONSTRAINTS PURGE;

CREATE TABLE staff_role (
    staff_role_id          CHAR(1) NOT NULL,
    staff_role_name        VARCHAR2(20) NOT NULL,
    staff_role_description VARCHAR2(100) NOT NULL
);

COMMENT ON COLUMN staff_role.staff_role_id IS
    'Staff role id for role name';

COMMENT ON COLUMN staff_role.staff_role_name IS
    'Name of the staff role';

COMMENT ON COLUMN staff_role.staff_role_description IS
    'Staff role description';

ALTER TABLE staff_role ADD CONSTRAINT staff_role_pk PRIMARY KEY ( staff_role_id );

INSERT INTO staff_role VALUES (
    'A',
    'Admin',
    'Take bookings, and reply to customer inquiries'
);

INSERT INTO staff_role VALUES (
    'C',
    'Cleaning',
    'Clean cabins and maintain resort''s public area'
);

INSERT INTO staff_role VALUES (
    'M',
    'Marketing',
    'Prepare and present marketing ideas and
deliverables '
);

COMMIT;

ALTER TABLE staff ADD staff_role_id CHAR(1) DEFAULT 'A' NOT NULL;

ALTER TABLE staff
    ADD CONSTRAINT staff_staffrole_fk FOREIGN KEY ( staff_role_id )
        REFERENCES staff_role ( staff_role_id );

SELECT
    *
FROM
    staff_role
ORDER BY
    staff_role_id;

SELECT
    staff_id,
    staff_role_id
FROM
    staff
ORDER BY
    staff_id;

DESC staff_role;
DESC staff;

        
/*4(c)*/

DROP TABLE clean_record CASCADE CONSTRAINTS PURGE;

DROP TABLE clean_staff_record CASCADE CONSTRAINTS PURGE;

CREATE TABLE clean_record (
    resort_id       NUMERIC(4) NOT NULL,
    cabin_no        NUMERIC(3) NOT NULL,
    clean_date      DATE NOT NULL,
    clean_staff_num NUMBER(2) NOT NULL
);

COMMENT ON COLUMN clean_record.resort_id IS
    'Resort identifier';

COMMENT ON COLUMN clean_record.cabin_no IS
    'Cabin number within the resort';

COMMENT ON COLUMN clean_record.clean_date IS
    'Date of clean the cabin';

COMMENT ON COLUMN clean_record.clean_staff_num IS
    'Number of staff clean the cabin';

ALTER TABLE clean_record
    ADD CONSTRAINT clean_record_pk PRIMARY KEY ( resort_id,
                                                 cabin_no,
                                                 clean_date );

ALTER TABLE clean_record
    ADD CONSTRAINT clean_cabin_fk FOREIGN KEY ( resort_id,
                                                cabin_no )
        REFERENCES cabin ( resort_id,
                           cabin_no );

CREATE TABLE clean_staff_record (
    resort_id              NUMERIC(4) NOT NULL,
    cabin_no               NUMERIC(3) NOT NULL,
    clean_date             DATE NOT NULL,
    staff_id               NUMERIC(5) NOT NULL,
    clean_staff_start_time DATE NOT NULL,
    clean_staff_end_time   DATE NOT NULL
);

ALTER TABLE clean_staff_record
    ADD CONSTRAINT clean_staff_pk PRIMARY KEY ( resort_id,
                                                cabin_no,
                                                clean_date,
                                                staff_id );

COMMENT ON COLUMN clean_staff_record.resort_id IS
    'Resort identifier';

COMMENT ON COLUMN clean_staff_record.cabin_no IS
    'Cabin number within the resort';

COMMENT ON COLUMN clean_staff_record.clean_date IS
    'Date of clean the cabin';

COMMENT ON COLUMN clean_staff_record.staff_id IS
    'Staff identifier of staff member who clean this cabin';

COMMENT ON COLUMN clean_staff_record.clean_staff_start_time IS
    'Staff start clean cabin time';

COMMENT ON COLUMN clean_staff_record.clean_staff_end_time IS
    'Staff end clean cabin time';

ALTER TABLE clean_staff_record
    ADD CONSTRAINT clean_cleanrecord_fk FOREIGN KEY ( resort_id,
                                                      cabin_no,
                                                      clean_date )
        REFERENCES clean_record ( resort_id,
                                  cabin_no,
                                  clean_date );

ALTER TABLE clean_staff_record
    ADD CONSTRAINT clean_staff_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id );

SELECT
    *
FROM
    clean_record;

SELECT
    *
FROM
    clean_staff_record;

DESC clean_record;
DESC clean_staff_record;