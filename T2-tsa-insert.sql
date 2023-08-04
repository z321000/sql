/*****PLEASE ENTER YOUR DETAILS BELOW*****/
/*T2-tsa-insert.sql*/

/*Unit Code:FIT2094*/
/*Applied Class No:03*/

/* Comments for your marker:




*/

/*-**This command shows the outputs of triggers**---*/
/*-**Run the command before running the insert statements.**---*/
/*-**Do not remove**---*/
SET SERVEROUTPUT ON
/*-**end**---*/

/*------------------------------------*/
/*INSERT INTO cabin*/


INSERT INTO cabin VALUES (
    1,
    11,
    1,
    2,
    'C',
    100,
    'The cabin has 1 bedroom, an outside common bathroom.'
);

INSERT INTO cabin VALUES (
    1,
    12,
    2,
    4,
    'I',
    120,
    'The cabin has 2 bedroom, an inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    1,
    13,
    3,
    6,
    'I',
    150,
    'The cabin has 3 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    1,
    14,
    1,
    1,
    'I',
    100,
    'The cabin has 1 bedroom, an inside cabin bathroom.'
);

INSERT INTO cabin VALUES (
    2,
    21,
    2,
    4,
    'I',
    120,
    'The cabin has 2 bedroom, an inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    2,
    22,
    1,
    1,
    'C',
    100,
    'The cabin has 1 bedroom, an outside common bathroom.'
);

INSERT INTO cabin VALUES (
    2,
    23,
    4,
    9,
    'I',
    200,
    'The cabin has 4 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    3,
    31,
    2,
    2,
    'C',
    110,
    'The cabin has 1 bedroom, an outside common bathroom.'
);

INSERT INTO cabin VALUES (
    3,
    32,
    4,
    8,
    'I',
    200,
    'The cabin has 4 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    3,
    33,
    3,
    6,
    'I',
    150,
    'The cabin has 3 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    4,
    41,
    3,
    5,
    'I',
    150,
    'The cabin has 3 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    5,
    51,
    2,
    3,
    'C',
    110,
    'The cabin has 2 bedroom, an outside common bathroom, a kitchen.'
);

INSERT INTO cabin VALUES (
    5,
    52,
    3,
    6,
    'I',
    150,
    'The cabin has 3 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    5,
    53,
    4,
    7,
    'I',
    200,
    'The cabin has 4 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    6,
    61,
    3,
    3,
    'C',
    140,
    'The cabin has 3 bedroom, an outside common bathroom.'
);

INSERT INTO cabin VALUES (
    6,
    62,
    2,
    3,
    'I',
    120,
    'The cabin has 2 bedroom, an inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    6,
    63,
    3,
    5,
    'I',
    150,
    'The cabin has 3 bedroom, an inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    6,
    64,
    1,
    1,
    'I',
    100,
    'The cabin has 1 bedroom, an inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    6,
    65,
    4,
    8,
    'I',
    200,
    'The cabin has 4 bedroom, two inside cabin bathroom, a spacious living room and a kitchen.'
);

INSERT INTO cabin VALUES (
    7,
    71,
    1,
    2,
    'I',
    100,
    'The cabin has 1 bedroom, an inside cabin bathroom, a spacious living room and a kitchen.'
);

COMMIT;

/*------------------------------------*/



/*------------------------------------*/
/*INSERT INTO booking*/
INSERT INTO booking VALUES (
    1,
    1,
    12,
    TO_DATE('01/03/2023', 'dd/mm/yyyy'),
    TO_DATE('06/03/2023', 'dd/mm/yyyy'),
    2,
    2,
    120 * ( TO_DATE('06/03/2023', 'dd/mm/yyyy') - TO_DATE('01/03/2023', 'dd/mm/yyyy')
    ),
    3,
    1
);

INSERT INTO booking VALUES (
    2,
    1,
    12,
    TO_DATE('15/03/2023', 'dd/mm/yyyy'),
    TO_DATE('21/03/2023', 'dd/mm/yyyy'),
    2,
    1,
    120 * ( TO_DATE('21/03/2023', 'dd/mm/yyyy') - TO_DATE('15/03/2023', 'dd/mm/yyyy')
    ),
    7,
    2
);

INSERT INTO booking VALUES (
    3,
    1,
    12,
    TO_DATE('04/04/2023', 'dd/mm/yyyy'),
    TO_DATE('11/04/2023', 'dd/mm/yyyy'),
    2,
    1,
    120 * ( TO_DATE('11/04/2023', 'dd/mm/yyyy') - TO_DATE('04/04/2023', 'dd/mm/yyyy')
    ),
    9,
    1
);

INSERT INTO booking VALUES (
    4,
    1,
    12,
    TO_DATE('22/04/2023', 'dd/mm/yyyy'),
    TO_DATE('27/04/2023', 'dd/mm/yyyy'),
    2,
    2,
    120 * ( TO_DATE('27/04/2023', 'dd/mm/yyyy') - TO_DATE('22/04/2023', 'dd/mm/yyyy')
    ),
    11,
    1
);

INSERT INTO booking VALUES (
    5,
    3,
    31,
    TO_DATE('05/03/2023', 'dd/mm/yyyy'),
    TO_DATE('09/03/2023', 'dd/mm/yyyy'),
    2,
    0,
    110 * ( TO_DATE('09/03/2023', 'dd/mm/yyyy') - TO_DATE('05/03/2023', 'dd/mm/yyyy')
    ),
    10,
    5
);

INSERT INTO booking VALUES (
    6,
    3,
    32,
    TO_DATE('05/03/2023', 'dd/mm/yyyy'),
    TO_DATE('10/03/2023', 'dd/mm/yyyy'),
    4,
    2,
    200 * ( TO_DATE('10/03/2023', 'dd/mm/yyyy') - TO_DATE('05/03/2023', 'dd/mm/yyyy')
    ),
    22,
    7
);

INSERT INTO booking VALUES (
    7,
    4,
    41,
    TO_DATE('05/04/2023', 'dd/mm/yyyy'),
    TO_DATE('10/04/2023', 'dd/mm/yyyy'),
    3,
    1,
    150 * ( TO_DATE('10/04/2023', 'dd/mm/yyyy') - TO_DATE('05/04/2023', 'dd/mm/yyyy')
    ),
    13,
    8
);

INSERT INTO booking VALUES (
    8,
    5,
    51,
    TO_DATE('15/03/2023', 'dd/mm/yyyy'),
    TO_DATE('18/03/2023', 'dd/mm/yyyy'),
    2,
    1,
    110 * ( TO_DATE('18/03/2023', 'dd/mm/yyyy') - TO_DATE('15/03/2023', 'dd/mm/yyyy')
    ),
    15,
    10
);

INSERT INTO booking VALUES (
    9,
    5,
    51,
    TO_DATE('21/03/2023', 'dd/mm/yyyy'),
    TO_DATE('25/03/2023', 'dd/mm/yyyy'),
    2,
    1,
    110 * ( TO_DATE('25/03/2023', 'dd/mm/yyyy') - TO_DATE('21/03/2023', 'dd/mm/yyyy')
    ),
    24,
    10
);

INSERT INTO booking VALUES (
    10,
    5,
    51,
    TO_DATE('10/04/2023', 'dd/mm/yyyy'),
    TO_DATE('15/04/2023', 'dd/mm/yyyy'),
    2,
    1,
    110 * ( TO_DATE('15/04/2023', 'dd/mm/yyyy') - TO_DATE('10/04/2023', 'dd/mm/yyyy')
    ),
    5,
    10
);

INSERT INTO booking VALUES (
    11,
    5,
    52,
    TO_DATE('03/03/2023', 'dd/mm/yyyy'),
    TO_DATE('06/03/2023', 'dd/mm/yyyy'),
    4,
    1,
    150 * ( TO_DATE('06/03/2023', 'dd/mm/yyyy') - TO_DATE('03/03/2023', 'dd/mm/yyyy')
    ),
    4,
    10
);

INSERT INTO booking VALUES (
    12,
    5,
    53,
    TO_DATE('10/04/2023', 'dd/mm/yyyy'),
    TO_DATE('14/04/2023', 'dd/mm/yyyy'),
    4,
    2,
    200 * ( TO_DATE('14/04/2023', 'dd/mm/yyyy') - TO_DATE('10/04/2023', 'dd/mm/yyyy')
    ),
    6,
    10
);

INSERT INTO booking VALUES (
    13,
    6,
    64,
    TO_DATE('19/03/2023', 'dd/mm/yyyy'),
    TO_DATE('25/03/2023', 'dd/mm/yyyy'),
    1,
    0,
    100 * ( TO_DATE('25/03/2023', 'dd/mm/yyyy') - TO_DATE('19/03/2023', 'dd/mm/yyyy')
    ),
    19,
    11
);

INSERT INTO booking VALUES (
    14,
    6,
    64,
    TO_DATE('01/04/2023', 'dd/mm/yyyy'),
    TO_DATE('06/04/2023', 'dd/mm/yyyy'),
    1,
    0,
    100 * ( TO_DATE('06/04/2023', 'dd/mm/yyyy') - TO_DATE('01/04/2023', 'dd/mm/yyyy')
    ),
    14,
    11
);

INSERT INTO booking VALUES (
    15,
    6,
    64,
    TO_DATE('20/04/2023', 'dd/mm/yyyy'),
    TO_DATE('24/04/2023', 'dd/mm/yyyy'),
    1,
    0,
    100 * ( TO_DATE('24/04/2023', 'dd/mm/yyyy') - TO_DATE('20/04/2023', 'dd/mm/yyyy')
    ),
    19,
    12
);

INSERT INTO booking VALUES (
    16,
    7,
    71,
    TO_DATE('08/03/2023', 'dd/mm/yyyy'),
    TO_DATE('11/03/2023', 'dd/mm/yyyy'),
    2,
    0,
    100 * ( TO_DATE('11/03/2023', 'dd/mm/yyyy') - TO_DATE('08/03/2023', 'dd/mm/yyyy')
    ),
    2,
    13
);

INSERT INTO booking VALUES (
    17,
    6,
    65,
    TO_DATE('11/03/2023', 'dd/mm/yyyy'),
    TO_DATE('15/03/2023', 'dd/mm/yyyy'),
    6,
    1,
    200 * ( TO_DATE('15/03/2023', 'dd/mm/yyyy') - TO_DATE('11/03/2023', 'dd/mm/yyyy')
    ),
    2,
    11
);

INSERT INTO booking VALUES (
    18,
    6,
    65,
    TO_DATE('08/04/2023', 'dd/mm/yyyy'),
    TO_DATE('11/04/2023', 'dd/mm/yyyy'),
    5,
    2,
    200 * ( TO_DATE('11/04/2023', 'dd/mm/yyyy') - TO_DATE('08/04/2023', 'dd/mm/yyyy')
    ),
    23,
    11
);

INSERT INTO booking VALUES (
    19,
    1,
    13,
    TO_DATE('17/03/2023', 'dd/mm/yyyy'),
    TO_DATE('19/03/2023', 'dd/mm/yyyy'),
    4,
    2,
    150 * ( TO_DATE('19/03/2023', 'dd/mm/yyyy') - TO_DATE('17/03/2023', 'dd/mm/yyyy')
    ),
    23,
    1
);

INSERT INTO booking VALUES (
    20,
    6,
    65,
    TO_DATE('20/04/2023', 'dd/mm/yyyy'),
    TO_DATE('24/04/2023', 'dd/mm/yyyy'),
    5,
    2,
    200 * ( TO_DATE('24/04/2023', 'dd/mm/yyyy') - TO_DATE('20/04/2023', 'dd/mm/yyyy')
    ),
    2,
    12
);

COMMIT;

/*------------------------------------*/