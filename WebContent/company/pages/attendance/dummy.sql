
--부서 더미데이터

INSERT INTO department (seq, department, phone, fax, room) VALUES (1, '개발부', '02-3427-4635', '3427-4635','701호');
INSERT INTO department (seq, department, phone, fax, room) VALUES (2, '인사부', '02-3427-4636', '3427-4636','302호');
INSERT INTO department (seq, department, phone, fax, room) VALUES (3, '총무부', '02-3427-4637', '3427-4637','204호');
INSERT INTO department (seq, department, phone, fax, room) VALUES (4, '영업부', '02-3427-4638', '3427-4637','403호');

SELECT * FROM department;
COMMIT;

--------------------------------------------

--직급 더미데이터

INSERT INTO tblposition (seq, POSITION) VALUES (1, '사장');
insert into tblPosition (seq, position) values (2, '부장');
insert into tblPosition (seq, position) values (3, '과장');
insert into tblPosition (seq, position) values (4, '사원');

SELECT * FROM tblposition;
COMMIT;

--------------------------------------------














--------------------------------------------

--근태관리_게시판_게시글 분류

CREATE TABLE atdbcategory
(
	seq NUMBER PRIMARY KEY,
	name varchar2(100) not null
);

insert into atdBCategory (seq, name) values (1, '공지사항');
insert into atdBCategory (seq, name) values (2, '일반');
INSERT INTO atdbcategory (seq, NAME) VALUES (3, '질문');
insert into atdBCategory (seq, name) values (4, '건의');

SELECT * FROM atdbcategory;
--------------------------------------------

--근태관리_게시판_게시글

create table atdBoard
(
	seq NUMBER PRIMARY KEY,
	eseq NUMBER NOT NULL REFERENCES employee(seq),
	cseq NUMBER NOT NULL REFERENCES atdbcategory(seq),
	subject VARCHAR2(1000) NOT NULL,
	regdate DATE DEFAULT sysdate,
	CONTENT VARCHAR2(2000) NOT NULL,
	readcount NUMBER DEFAULT 0 NOT NULL ,
	THREAD NUMBER NOT NULL,
	DEPTH NUMBER NOT NULL
);

--------------------------------------------

--근태관리_게시판_공감과 비공감

CREATE TABLE atdBLike
(
	seq NUMBER PRIMARY KEY,
	eseq NUMBER NOT NULL REFERENCES employee(seq),
	bseq NUMBER NOT NULL REFERENCES atdboard(seq),
	STATE NUMBER DEFAULT 0 NOT NULL 
);

--------------------------------------------

--근태관리_게시판_댓글

CREATE TABLE atdbcomment
(
	seq NUMBER PRIMARY KEY,
	eseq NUMBER NOT NULL REFERENCES employee(seq),
	bseq NUMBER NOT NULL REFERENCES atdboard(seq),
	regdate DATE DEFAULT sysdate,
	CONTENT VARCHAR2(2000) NOT NULL,
	THREAD NUMBER NOT NULL,
	DEPTH NUMBER NOT NULL
);

--------------------------------------------

--근태관리_게시판_첨부파일

CREATE TABLE atdbfile
(
	seq NUMBER PRIMARY KEY,
	bseq NUMBER NOT NULL REFERENCES atdboard(seq),
	orgfilename VARCHAR2(500) NOT NULL,
	FILENAME VARCHAR2(500) NOT NULL
);

--------------------------------------------

--근태관리_근태기록_근태유형

CREATE TABLE atdWrCategory
(
	seq NUMBER PRIMARY KEY,
	case VARCHAR2(1000) NOT NULL
);
SELECT * FROM atdWrCategory;
drop table atdWrCategory;

INSERT INTO atdwrcategory (seq, case) VALUES (1, '정상근무');
INSERT INTO atdwrcategory (seq, case) VALUES (2, '특근');
INSERT INTO atdwrcategory (seq, case) VALUES (3, '야근');
INSERT INTO atdwrcategory (seq, case) VALUES (5, '지각');
INSERT INTO atdwrcategory (seq, case) VALUES (6, '조퇴');

--------------------------------------------

--근태관리_근태기록(공통업무)

CREATE TABLE atdWorkRecord
(
	seq NUMBER PRIMARY KEY,
	eseq NUMBER NOT NULL REFERENCES employee(seq),
	cometime DATE NOT NULL,
	LEAVETIME DATE NOT NULL,
	memo VARCHAR2(2000) NULL
);

--------------------------------------------

--근태관리_근태기록_유형관리

CREATE TABLE atdWrCtgManage
(
    seq number PRIMARY KEY ,
    wrseq NUMBER NOT NULL REFERENCES atdWorkRecord(seq),
    cseq NUMBER NOT NULL REFERENCES atdWrCategory(seq)
);

--------------------------------------------

--근태관리_기타 근태기록_근태유형
CREATE TABLE atdEtcCategory
(
	seq NUMBER PRIMARY KEY,
	case VARCHAR2(1000) NOT NULL
);

INSERT INTO atdEtcCategory (seq, case) VALUES (1, '')


SELECT * FROM atdworkrecord;
DROP TABLE ATDWORKRECORD;




COMMIT;









INSERT INTO atdwrcategory (seq, categorys) VALUES (5, '정상근무,야근');
insert into atdWrCategory (seq, categorys) values (6, '정상근무,외근');
INSERT INTO atdwrcategory (seq, categorys) VALUES (7, '특근,야근');
INSERT INTO atdwrcategory (seq, categorys) VALUES (8, '특근,외근');

drop table atdWRCATEGORY;
SELECT * FROM ATDWRCATEGORY;
DELETE FROM atdwrcategory;

ALTER TABLE ATDWRCATEGORY DROP COLUMN 
--------------------------------------------


--------------------------------------------

--근태관리_휴가기록_휴가유형

CREATE TABLE atdvrcategory
(
	seq NUMBER PRIMARY KEY,
	name varchar2(500) not null
);

insert into atdVrCategory (seq, name) values (1, '연차');
insert into atdVrCategory (seq, name) values (2, '반차');

insert into atdVrCategory (seq, name) values (4, '경조휴가');
insert into atdVrCategory (seq, name) values (5, '하계휴가');
insert into atdVrCategory (seq, name) values (6, '동계휴가');
INSERT INTO atdvrcategory (seq, NAME) VALUES (7, '결근');
DELETE FROM atdvrcategory;
SELECT * FROM atdvrcategory;
DROP TABLE ATDVRCATEGORY;

--------------------------------------------

--근태관리_근태기록_근태유형


CREATE TABLE atdVACRecord
(
	seq NUMBER PRIMARY KEY,
	eseq NUMBER NOT NULL REFERENCES employee(seq),
	cseq NUMBER NOT NULL REFERENCES atdwrcategory(seq),
	LEAVETIME DATE NOT NULL,
	COMETIME DATE NOT NULL
);

DROP TABLE atdvacrecord;
SELECT * FROM ATDVACRECORD;
--------------------------------------------


--------------------------------------------

--근태관리_근태기록(공통업무)

insert into atdWorkRecord (seq, eseq, cseq, comeTime, leaveTime) values ('고유번호', '직원번호', '카테고리번호', '출근시각', '퇴근시각');

insert into atdWorkRecord (seq, eseq, cseq, comeTime, leaveTime) values (1, 10, 1, to_char('2017-08-01 09:00', 'yyyy-mm-dd hh:mi'), to_char('2017-08-01 18:00', 'yyyy-mm-dd hh:mi'));

SELECT * FROM ATDWORKRECORD;

SELECT * FROM atdwrcategory;



DROP TABLE atdworkrecord;
DROP TABLE atdWrCategory;
DROP TABLE atdVacRecord;
DROP TABLE atdworkrecord;
DROP TABLE atdworkrecord;
DROP TABLE atdworkrecord;






