--------------------------clubDML.sql-----------------------------------------------
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '스포츠');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '레저');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '교육');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '게임');
INSERT INTO CLUBCATEGORY VALUES (CLUBCATEGORYSEQ.nextval, '문화');

commit;

INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '축구왕 슛돌이들','주말아침 축구를 하기위한 모임입니다.', 1, 39,'/Project/company/images/football.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 1, 39, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '테니스 왕자와 공주','IT 업계 최고의 테니스 선수가 되기위한 시작!', 1, 43,'/Project/company/images/tenis.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 2, 43, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '홈런왕','야구 노잼 다들 축구하세요', 2, 44,null);
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 3, 44, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'PinFineApple','볼링 동호회 입니다. 신입횐님들 환영', 1, 10,'/Project/company/images/balling.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 4, 10, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '세월을 낚자','베스,블루길 강낚시 전문 모임', 2, 39,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 5, 39, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '코딩은 즐거워','알고리즘 공부, 새로운 기술 연구, 여러가지 취미관련 개발', 3, 49,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 6, 49, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'FineApple of Legends','롤에 미친 사람들', 4, 38,'/Project/company/images/logo2black.png');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 7, 38, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'Club Mania','홍대, 강남, 이태원 등 각종 클럽 or 감성주점 섭렵', 2, 46,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 8, 46, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '찰칵찰칵','남는건 사진이다.', 5, 40,'/Project/company/images/logo1black.PNG');
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 9, 40, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, 'I love Idol','아이돌 콘서트 티켓 같이 예매성공해서 같이 보러가는 모임', 5, 41,NULL );
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 10, 41, sysdate);
INSERT INTO CLUB(seq,name,DETAIL,CATEGORYSEQ,EMPSEQ,CLUBIMAGE) VALUES (ClubSEQ.nextval, '시네마천국','영화를 같이 즐겨요', 5, 42,null);
INSERT INTO CLUBMEMBER VALUES (clubmemberseq.nextval, 11, 42, sysdate);

insert INTO CLUBMEMBER VALUES  (CLUBMEMBERSEQ.nextval, 8, 39, sysdate);
SELECT * FROM club;
SELECT * from CLUBCATEGORY;
SELECT * FROM EMPLOYEE;

SELECT * FROM CLUBMEMBER WHERE EMPSEQ=39;
update club set CLUBIMAGE = '/Project/company/images/baseball.jpg' where seq=3;
update club set CLUBIMAGE = '/Project/company/images/fishing.jpg' where seq=5;
update club set CLUBIMAGE = '/Project/company/images/coding.jpg' where seq=6;
update club set CLUBIMAGE = '/Project/company/images/lol.jpg' where seq=7;
update club set CLUBIMAGE = '/Project/company/images/camera.jpg' where seq=9;
UPDATE club SET CLUBIMAGE = '/Project/company/images/logo2black.png' WHERE seq = 7;
UPDATE club SET CLUBIMAGE = '/Project/company/images/logo1black.png' WHERE seq = 9;
UPDATE club SET CLUBIMAGE = '/Project/company/images/arena.jpg' WHERE seq = 8;
commit;

select * from clubboard;
--------------------------------전체 정기모임 리스트 뷰---------------------------------------------
CREATE OR REPLACE VIEW clublistView
  AS
SELECT c.SEQ as seq, c.NAME as name, c.DETAIL as detail, c.openDate as openDate, cc.NAME as categoryName, e.NAME as empName, d.department as department, c.CLUBIMAGE as clubImg FROM DEPARTMENT d
  INNER JOIN EMPLOYEE e on d.SEQ = e.DEPARTMENTSEQ
   INNER JOIN club c on e.SEQ = c.EMPSEQ
    INNER JOIN CLUBCATEGORY cc on c.CATEGORYSEQ = cc.SEQ
  order by seq ASC ;

SELECT * FROM clublistView;

select * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

--------사원번호로 모임이름 따오기----------
SELECT c.NAME as clubname from club c INNER JOIN CLUBMEMBER m ON c.SEQ = m.CLUBSEQ INNER JOIN EMPLOYEE e on c.EMPSEQ = e.SEQ WHERE m.EMPSEQ=39;

SELECT c.NAME as clubname from club c INNER JOIN CLUBMEMBER m ON c.SEQ = m.CLUBSEQ INNER JOIN EMPLOYEE e on c.EMPSEQ = e.SEQ WHERE m.EMPSEQ=39;


----------------------------------------------------
INSERT INTO  () VALUES ();
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,11,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,12,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,13,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,14,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,50,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,60,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,61,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,62,sysdate);
INSERT INTO CLUBMEMBER VALUES (CLUBMEMBERSEQ.nextval,1,10,sysdate);
COMMIT ;

INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'안녕하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,20,1,'안녕하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,19,1,'안녕하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'zzzz','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'sdff하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,2,1,1,'g333하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,1,1,1,'1444하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARD(seq,CATEGORYSEQ,MEMBERSEQ,CLUBSEQ,TITLE,CONTENT) VALUES (CLUBBOARDSEQ.nextval,1,1,5,'1444하세요','반갑습니다 ㅋㅋ');
INSERT INTO CLUBBOARDFILES VALUES (CLUBBOARDFILESSEQ.nextval,1,'football.png','football.png');
SELECT * from CLUBBOARDFILES;
commit;
select * FROM CLUBBOARD;
SELECT * from CLUB;
SELECT * FROM EMPLOYEE;
SELECT * FROM CLUBMEMBER;

INSERT INTO CLUBBOARDCATEGORY VALUES (CLUBBOARDCATEGORYSEQ.nextval, '공지');
INSERT INTO CLUBBOARDCATEGORY VALUES (CLUBBOARDCATEGORYSEQ.nextval, '일반글');

SELECT rownum as rnum, a.* FROM
(SELECT cb.SEQ, cb.TITLE as title, cb.CONTENT as content, e.NAME as name, cb.REGDATE as regdate, cb.READCOUNT, round((sysdate-cb.REGDATE)*24*60) as gap  from CLUBBOARDCATEGORY cbc INNER JOIN CLUBBOARD cb on cbc.SEQ = cb.CATEGORYSEQ
  INNER JOIN CLUBMEMBER cm ON cb.MEMBERSEQ = cm.SEQ INNER JOIN club c ON cb.CLUBSEQ = c.SEQ
  INNER JOIN employee e on cm.EMPSEQ = e.SEQ  WHERE cb.CLUBSEQ=1 order BY cb.SEQ ASC) a ORDER BY rnum ASC ;

select * from (select a.*, rownum as rnum from
  (select seq, name, subject, readCount, regDate, round((sysdate - regDate) * 24 * 60) as gap, commentCount, filename
   from tblBoard %s order by seq desc) a)
where rnum >= %s and rnum <= %s", where, map.get("start"), map.get("end"))