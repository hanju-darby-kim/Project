INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '사담');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '정보');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '맛집');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '업무');
INSERT INTO FBCategory (SEQ, NAME) VALUES (FBCategorySeq.nextval, '연애');

commit;

CREATE VIEW vEmployee
AS
SELECT


  SELECT
    e.seq as empSeq,
    e.NAME as name,
    e.JUMIN as jumin,
    e.CELLPHONE as cellphone,
    e.EMAIL as email,
    e.FIRSTDATE as firstDate,
    e.ENDDATE as ENDDATE,
    e.PAYMENT as payment,
    e.DEPARTMENTSEQ as departmentSeq,
    d.DEPARTMENT as department,
    e.GENDER as gender,
    e.PHONE as phone,
    e.PROFILEPIC as profilePic,
    e.task as task,
    e.POSITIONSEQ as positionSeq
  FROM EMPLOYEE e
    INNER JOIN DEPARTMENT d
      ON e.DEPARTMENTSEQ = d.SEQ
        INNER JOIN TBLPOSITION p
          ON e.POSITIONSEQ = p.SEQ;

select * from EMPLOYEE;
select * from DEPARTMENT;
select * from position;


COMMIT;