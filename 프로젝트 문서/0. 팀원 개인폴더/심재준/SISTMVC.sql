select * from tabs;
select * from tab;
select * from employee;



select * from tblMsgSent;
select * from tblMsgRead;

delete from tblmsgsent;
delete from tblMsgRead;
commit;


--뷰, (보낸쪽지+받은쪽지)

--조인 구문
SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave,
  r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave
     FROM tblmsgsent S INNER JOIN tblMsgRead R
       ON s.seq = r.msgnumber;

select * from (SELECT s.seq as sseq, s.sentemployeenum, s.title, s.content, s.sentdate, s.sentdelete, s.sentsave,
  r.seq as rseq, r.msgnumber, r.reademployeenum, r.readdate, r.readdelete, r.readsave
     FROM tblmsgsent S INNER JOIN tblMsgRead R
       ON s.seq = r.msgnumber)
        where (sentemployeenum = 55 and sentsave = 'Y') or (reademployeenum = 55 and readsave = 'Y')
          order by sseq desc;

--보낸쪽지 테이블
select * from tblmsgsent order by seq;
select * from tblmsgsent where sentemployeenum = 55 and sentsave = 'Y' order by seq;

select * from tblmsgsent where seq = (select max(seq) from tblmsgsent);
select max(seq) as num from tblmsgsent;

select * from employee;
drop table tblMsgSent;
create table tblMsgSent
(
  seq NUMBER PRIMARY KEY,
  sentEmployeeNum
    REFERENCES employee,
  title VARCHAR2(100) not null,
  content VARCHAR2(2000) not null,
  sentDate DATE,
  sentDelete VARCHAR2(1),
  sentSave VARCHAR2(1)
);
alter table tblmsgsent MODIFY (sentdate default sysdate);
alter table tblmsgsent MODIFY (sentDelete default 'N');
alter table tblmsgsent MODIFY (sentSave default 'N');

insert into tblMsgSent (seq, sentEmployeeNum, title, content, sentDate, sentDelete, sentSave)
  VALUES (msgsentseq.nextval, 15, 22, 333, DEFAULT, DEFAULT, DEFAULT);
commit;

--받은쪽지 테이블
select * from tblMsgRead order by seq;
select * from tblMsgRead where reademployeenum = 55 and readsave = 'Y';

CREATE table tblMsgRead
(
  seq number PRIMARY KEY,
  msgNumber NUMBER
    REFERENCES tblmsgsent,
  readEmployeeNum NUMBER
    REFERENCES employee,
  readDate DATE,
  readDelete VARCHAR2(1),
  readSave VARCHAR2(1)
);
alter table tblMsgRead MODIFY (readDate default NULL);
alter table tblMsgRead MODIFY (readDelete default 'N');
alter table tblMsgRead MODIFY (readSave default 'N');
insert into tblMsgRead (seq, msgNumber, readEmployeeNum, readDate, readDelete, readSave)
  VALUES (msgreadseq.nextval, 68, 55, DEFAULT, DEFAULT, DEFAULT);
select * from tblMsgRead;
commit;



--쪽지설정
drop table tblmsgoption;
create table tblMsgOption
(
  seq number PRIMARY KEY ,
  MsgOpEmployee NUMBER NOT NULL
    REFERENCES employee,
  MsgOppagenum number
);
--차단인목록
drop table tblmsgblock;
create table tblMsgBlock
(
  seq number PRIMARY KEY ,
  blcokEmployee number
    REFERENCES employee,
  blockuser number
    REFERENCES employee
);
--금지어목록
create table tblMsgfilter
(
  seq NUMBER PRIMARY KEY ,
  filterEmployee NUMBER
    REFERENCES employee,
  filterword VARCHAR2(30)
);

create SEQUENCE msgblockSeq;
create SEQUENCE msgfilterSeq;
create SEQUENCE msgoptionSeq;
create SEQUENCE msgreadSeq;
create SEQUENCE msgsentSeq;





































--의영이형꺼
/* 수입내역 */
create SEQUENCE IncomeSeq;
CREATE TABLE tblIncome (
	seq NUMBER NOT NULL, /* 번호 */
	empSeq NUMBER NOT NULL, /* 직원번호 */
	cSeq NUMBER NOT NULL, /* 카테고리번호 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일자 */
	conDate DATE, /* 승인일자 */
	content VARCHAR2(2000) NOT NULL, /* 내용 */
	goods VARCHAR2(500) NOT NULL, /* 판매물품 */
	units NUMBER NOT NULL, /* 개수 */
	amount NUMBER NOT NULL, /* 금액 */
	confirm VARCHAR2(10), /* 승인여부 */
	etc VARCHAR2(500), /* 비고 */
	aSeq NUMBER, /* 연결계좌번호 */
	respSeq NUMBER /* 승인인 */
);

CREATE UNIQUE INDEX PK_tblIncome
	ON tblIncome (
		seq ASC
	);

ALTER TABLE tblIncome
	ADD
		CONSTRAINT PK_tblIncome
		PRIMARY KEY (
			seq
		);

/* 지출카테고리 */
create SEQUENCE OCategorySeq;
CREATE TABLE tblOCategory (
	seq NUMBER NOT NULL, /* 번호 */
	name VARCHAR2(100) NOT NULL /* 지출카테고리명 */
);

CREATE UNIQUE INDEX PK_tblOCategory
	ON tblOCategory (
		seq ASC
	);

ALTER TABLE tblOCategory
	ADD
		CONSTRAINT PK_tblOCategory
		PRIMARY KEY (
			seq
		);

/* 회사 재정 */
create SEQUENCE accountSeq;
CREATE TABLE tblAccount (
	seq NUMBER NOT NULL, /* 번호 */
	name VARCHAR2(50) NOT NULL, /* 이름 */
	aNumber VARCHAR2(50) NOT NULL, /* 계좌번호 */
	balance NUMBER NOT NULL, /* 잔고 */
	regDate DATE DEFAULT sysdate NOT NULL /* 날짜 */
);

CREATE UNIQUE INDEX PK_tblAccount
	ON tblAccount (
		seq ASC
	);

ALTER TABLE tblAccount
	ADD
		CONSTRAINT PK_tblAccount
		PRIMARY KEY (
			seq
		);

/* 수입카테고리 */
create SEQUENCE  icategorySeq;
CREATE TABLE tblICategory (
	seq NUMBER NOT NULL, /* 번호 */
	name VARCHAR2(100) NOT NULL /* 수입카테고리명 */
);

CREATE UNIQUE INDEX PK_tblICategory
	ON tblICategory (
		seq ASC
	);

ALTER TABLE tblICategory
	ADD
		CONSTRAINT PK_tblICategory
		PRIMARY KEY (
			seq
		);

/* 지출내역 */
create SEQUENCE outcomeSeq;
CREATE TABLE tblOutcome (
	seq NUMBER NOT NULL, /* 번호 */
	empSeq NUMBER NOT NULL, /* 직원번호 */
	cSeq NUMBER NOT NULL, /* 카테고리번호 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일자 */
	conDate DATE, /* 승인일자 */
	content VARCHAR2(2000) NOT NULL, /* 내용 */
	amount NUMBER NOT NULL, /* 금액 */
	etc VARCHAR2(500), /* 비고 */
	aSeq NUMBER, /* 연결계좌번호 */
	respSeq NUMBER /* 승인인 */
);

CREATE UNIQUE INDEX PK_tblOutcome
	ON tblOutcome (
		seq ASC
	);

ALTER TABLE tblOutcome
	ADD
		CONSTRAINT PK_tblOutcome
		PRIMARY KEY (
			seq
		);

/* 프로젝트 */
create SEQUENCE projectSeq;
CREATE TABLE tblProject (
	seq NUMBER NOT NULL, /* 번호 */
	depSeq NUMBER NOT NULL, /* 부서번호 */
	empSeq NUMBER NOT NULL, /* 작성자 */
	respSeq NUMBER NOT NULL, /* 담당자 */
	subject VARCHAR2(500) NOT NULL, /* 주제 */
	goal VARCHAR2(1000) NOT NULL, /* 목표 */
	content VARCHAR2(2000) NOT NULL, /* 설명 */
	startDate DATE NOT NULL, /* 시작날짜 */
	endDate DATE NOT NULL, /* 종료날짜 */
	type VARCHAR2(10) /* 공지여부 */
);

CREATE UNIQUE INDEX PK_tblProject
	ON tblProject (
		seq ASC
	);

ALTER TABLE tblProject
	ADD
		CONSTRAINT PK_tblProject
		PRIMARY KEY (
			seq
		);

/* 프로젝트일단위 */
create SEQUENCE punitSeq;
CREATE TABLE tblPUnit (
	seq NUMBER NOT NULL, /* 번호 */
	pSeq NUMBER NOT NULL, /* 프로젝트번호 */
	work VARCHAR(500) NOT NULL, /* 업무 */
	startDate DATE NOT NULL, /* 시작날짜 */
	endDate DATE NOT NULL /* 종료날짜 */
);

CREATE UNIQUE INDEX PK_tblPUnit
	ON tblPUnit (
		seq ASC
	);

ALTER TABLE tblPUnit
	ADD
		CONSTRAINT PK_tblPUnit
		PRIMARY KEY (
			seq
		);

/* 프로젝트상세 */
create SEQUENCE pdetailSeq;
CREATE TABLE tblPDetail (
	seq NUMBER NOT NULL, /* 번호 */
	unitSeq NUMBER NOT NULL, /* 프로젝트일단위번호 */
	empSeq NUMBER NOT NULL, /* 담당자 */
	content VARCHAR2(500) NOT NULL /* 담당업무설명 */
);

CREATE UNIQUE INDEX PK_tblPDetail
	ON tblPDetail (
		seq ASC
	);

ALTER TABLE tblPDetail
	ADD
		CONSTRAINT PK_tblPDetail
		PRIMARY KEY (
			seq
		);

/* 프로젝트 댓글 */
create SEQUENCE pcommentSeq;
CREATE TABLE tblPComment (
	seq NUMBER NOT NULL, /* 번호 */
	projectSeq NUMBER NOT NULL, /* 프로젝트번호 */
	empSeq NUMBER NOT NULL, /* 작성자번호 */
	regDate DATE DEFAULT sysdate NOT NULL, /* 작성일자 */
	content VARCHAR2(500) NOT NULL /* 내용 */
);

CREATE UNIQUE INDEX tblPComment
	ON tblPComment (
		seq ASC
	);

ALTER TABLE tblPComment
	ADD
		CONSTRAINT tblPComment
		PRIMARY KEY (
			seq
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_department_TO_employee
		FOREIGN KEY (
			departmentSeq
		)
		REFERENCES department (
			seq
		);

ALTER TABLE employee
	ADD
		CONSTRAINT FK_tblPosition_TO_employee
		FOREIGN KEY (
			positionSeq
		)
		REFERENCES tblPosition (
			seq
		);

ALTER TABLE tblIncome
	ADD
		CONSTRAINT FK_employee_TO_tblIncome
		FOREIGN KEY (
			empSeq
		)
		REFERENCES employee (
			seq
		);

ALTER TABLE tblIncome
	ADD
		CONSTRAINT FK_tblICategory_TO_tblIncome
		FOREIGN KEY (
			cSeq
		)
		REFERENCES tblICategory (
			seq
		);

ALTER TABLE tblIncome
	ADD
		CONSTRAINT FK_employee_TO_tblIncome2
		FOREIGN KEY (
			respSeq
		)
		REFERENCES employee (
			seq
		);

ALTER TABLE tblIncome
	ADD
		CONSTRAINT FK_tblAccount_TO_tblIncome
		FOREIGN KEY (
			aSeq
		)
		REFERENCES tblAccount (
			seq
		);

ALTER TABLE tblOutcome
	ADD
		CONSTRAINT FK_employee_TO_tblOutcome
		FOREIGN KEY (
			empSeq
		)
		REFERENCES employee (
			seq
		);

ALTER TABLE tblOutcome
	ADD
		CONSTRAINT FK_tblOCategory_TO_tblOutcome
		FOREIGN KEY (
			cSeq
		)
		REFERENCES tblOCategory (
			seq
		);

ALTER TABLE tblOutcome
	ADD
		CONSTRAINT FK_employee_TO_tblOutcome2
		FOREIGN KEY (
			respSeq
		)
		REFERENCES employee (
			seq
		);

ALTER TABLE tblOutcome
	ADD
		CONSTRAINT FK_tblAccount_TO_tblOutcome
		FOREIGN KEY (
			aSeq
		)
		REFERENCES tblAccount (
			seq
		);

ALTER TABLE tblProject
	ADD
		CONSTRAINT FK_employee_TO_tblProject
		FOREIGN KEY (
			respSeq
		)
		REFERENCES employee (
			seq
		);

ALTER TABLE tblProject
	ADD
		CONSTRAINT FK_department_TO_tblProject
		FOREIGN KEY (
			depSeq
		)
		REFERENCES department (
			seq
		);

ALTER TABLE tblProject
	ADD
		CONSTRAINT FK_employee_TO_tblProject2
		FOREIGN KEY (
			empSeq
		)
		REFERENCES employee (
			seq
		);

ALTER TABLE tblPUnit
	ADD
		CONSTRAINT FK_tblProject_TO_tblPUnit
		FOREIGN KEY (
			pSeq
		)
		REFERENCES tblProject (
			seq
		);

ALTER TABLE tblPDetail
	ADD
		CONSTRAINT FK_tblPUnit_TO_tblPDetail
		FOREIGN KEY (
			unitSeq
		)
		REFERENCES tblPUnit (
			seq
		);

ALTER TABLE tblPDetail
	ADD
		CONSTRAINT FK_employee_TO_tblPDetail
		FOREIGN KEY (
			empSeq
		)
		REFERENCES employee (
			seq
		);

ALTER TABLE tblPComment
	ADD
		CONSTRAINT FK_tblProject_TO_tblPComment
		FOREIGN KEY (
			projectSeq
		)
		REFERENCES tblProject (
			seq
		);

ALTER TABLE tblPComment
	ADD
		CONSTRAINT FK_employee_TO_tblPComment
		FOREIGN KEY (
			empSeq
		)
		REFERENCES employee (
			seq
		);


