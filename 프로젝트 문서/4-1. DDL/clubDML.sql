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

SELECT * FROM club;
SELECT * from CLUBCATEGORY;
SELECT * FROM EMPLOYEE;

SELECT * FROM CLUBMEMBER;

UPDATE club SET CLUBIMAGE = '/Project/company/images/logo2black.png' WHERE seq = 7;
UPDATE club SET CLUBIMAGE = '/Project/company/images/logo1black.png' WHERE seq = 9;
UPDATE club SET CLUBIMAGE = '/Project/company/images/arena.jpg' WHERE seq = 8;
commit;

CREATE OR REPLACE VIEW clublistView
  AS
SELECT c.SEQ as seq, c.NAME as name, c.DETAIL as detail, c.openDate as openDate, cc.NAME as categoryName, e.NAME as empName, d.department as department, c.CLUBIMAGE as clubImg FROM DEPARTMENT d
  INNER JOIN EMPLOYEE e on d.SEQ = e.DEPARTMENTSEQ
   INNER JOIN club c on e.SEQ = c.EMPSEQ
    INNER JOIN CLUBCATEGORY cc on c.CATEGORYSEQ = cc.SEQ;

SELECT * FROM clublistView;

select * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

SELECT c.NAME as clubname from club c INNER JOIN CLUBMEMBER m ON c.SEQ = m.CLUBSEQ INNER JOIN EMPLOYEE e on c.EMPSEQ = e.SEQ WHERE e.SEQ=39;
