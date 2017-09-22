INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '사담');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '정보');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '맛집');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '업무');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '연애');

commit;

CREATE VIEW vEmployee
AS
  SELECT
    e.seq as empSeq,
    e.NAME as name,
    e.JUMIN as jumin,
    e.CELLPHONE as cellphone,
    e.EMAIL as email,
    e.FIRSTDATE as firstDate,
    e.ENDDATE as endDate,
    e.PAYMENT as payment,
    e.DEPARTMENTSEQ as departmentSeq,
    d.DEPARTMENT as department,
    e.GENDER as gender,
    e.PHONE as phone,
    e.PROFILEPIC as profilePic,
    e.task as task,
    e.POSITIONSEQ as positionSeq,
    p.POSITION as position
  FROM EMPLOYEE e
    INNER JOIN DEPARTMENT d
      ON e.DEPARTMENTSEQ = d.SEQ
        INNER JOIN TBLPOSITION p
          ON e.POSITIONSEQ = p.SEQ;

select * from EMPLOYEE;
select * from DEPARTMENT;
select * from vEmployee;

SELECT * FROM freeboard;
COMMIT;

select * from FBFILE;
INSERT INTO freeboard (seq, empSeq, FBCategory, title, content, readCount, regDate, thread, depth) VALUES (freeBoardSeq.nextVal, 10, 1, '열심히합시다', '야근합시다', DEFAULT, DEFAULT, DEFAULT, DEFAULT);

INSERT INTO (seq, FBSeq, orgFileName, fileName) VALUES (FBFileSeq.nextVal, 4, 'test', 'test');


