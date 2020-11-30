-- board_tbl Table 생성
drop table board_tbl;
create table board_tbl(
	idx number(6) not null,
	writer varchar2(20),
	subject varchar2(255),
	content clob,
	regDate timestamp,
	primary key (idx)
);

select * from board_tbl;

-- board_tbl Sequence 생성
drop sequence board_seq;
create sequence board_seq
	start with 1
	increment by 1
	minvalue 1;

insert into board_tbl values(board_seq.nextval, '김회원' ,'정보처리 산업기사 쉽다', 'jsp 쉽네요', '2018-07-31 12:34:56');
insert into board_tbl values(board_seq.nextval, '김회원' ,'웹 디자인 기능사 어렵다', 'jquery 그냥그럼', '2018-07-31 12:43:43');
insert into board_tbl values(board_seq.nextval, '이회원' ,'웹 디자인 기능사 어렵다', 'jquery 그냥그', '2018-07-31 18:23:43');
insert into board_tbl values(board_seq.nextval, '이회원' ,'웹 디자인 기능사 어렵다', 'jquery 그냥', '2018-08-01 19:13:43');
insert into board_tbl values(board_seq.nextval, '박회원' ,'웹 디자인 기능사 어렵다', 'jquery 그', '2018-08-31 13:13:43');
insert into board_tbl values(board_seq.nextval, '박회원' ,'웹 디자인 기능사 어렵다', 'jquery 어렵네요', '2018-08-31 13:43:43');
insert into board_tbl values(board_seq.nextval, '강회원' ,'웹 디자인 기능사 어렵다', 'jquery 어네요', '2018-08-31 13:2:43');
insert into board_tbl values(board_seq.nextval, '나회원' ,'웹 디자인 기능사 어렵다', 'jquery 어요', '2018-08-31 18:43:43');
insert into board_tbl values(board_seq.nextval, '문회원' ,'웹 디자인 기능사 어렵다', 'jquery 어', '2018-08-31 17:43:43');
insert into board_tbl values(board_seq.nextval, '지회원' ,'여름아', 'jquery 어렵네요', '2018-08-31 12:43:43');

-- comment_tbl Table 생성
drop table comment_tbl;
create table comment_tbl(
	idx number(6) not null,
	bidx number(6),
	writer varchar2(20),
	content clob,
	regDate timestamp,
	primary key (idx)
);

select * from comment_tbl;

-- comment_tbl Sequence 생성
drop sequence comment_seq;
create sequence comment_seq
	start with 1
	increment by 1
	minvalue 1;

insert into comment_tbl values(comment_seq.nextval,1,'김회원','Lorem ipsum dolor sit amet','2018-08-01 12:34:56');
insert into comment_tbl values(comment_seq.nextval,3,'김회원','consectetur adipiscing elit','2018-08-01 12:43:43');
insert into comment_tbl values(comment_seq.nextval,5,'이회원','sed do eiusmod tempor','2018-08-02 13:34:56');
insert into comment_tbl values(comment_seq.nextval,7,'이회원','ㅑncididunt ut labore et','2018-08-03 13:43:34');
insert into comment_tbl values(comment_seq.nextval,9,'박회원','dolore magna aliqua','2018-08-04 13:12:10');
insert into comment_tbl values(comment_seq.nextval,2,'박회원','minim veniam, quis nostrud','2018-08-04 14:34:20');
insert into comment_tbl values(comment_seq.nextval,3,'강회원','exercitation ulamco laboris','2018-08-05 14:56:30');
insert into comment_tbl values(comment_seq.nextval,5,'나회원','nisi ut aliquip','2018-08-06 15:43:35');
insert into comment_tbl values(comment_seq.nextval,7,'문회원','ex ea commodo consequat','2018-08-07 16:21:40');
insert into comment_tbl values(comment_seq.nextval,2,'지회원','Duis aute irure dolor','2018-08-07 17:01:45');

select * from board_tbl;
select * from comment_tbl;

-- board 목록 조회
select idx, writer, subject, content, regDate from board_tbl order by regDate desc;

-- 게시글 조회
select idx, writer, subject, content, regDate from BOARD_TBL where idx = 2;

-- 게시글 정보 입력
insert into BOARD_TBL 
values(board_seq.nextval, '게시물', '제목', '내용인데요', sysdate);

-- 게시글 정보 수정
update BOARD_TBL
   set writer='수정', subject='제목수정인데', content='이건내용수정인데'
 where idx='11';

-- 게시글 삭제
delete from BOARD_TBL where idx='0';
select * from board_tbl;

-- Comment 목록 조회
select idx, bidx, writer, content, regdate from comment_tbl where bidx='2';
select idx, bidx, writer, content, regdate from comment_tbl where idx='1';

-- 댓글 입력
insert into comment_tbl 
values(comment_seq.nextval, '3', '댓글이름', '댓글내용', sysdate);

-- 댓글 삭제
delete from comment_tbl where idx='11';

select * from comment_tbl;

-- 게시글 갯수
select count(*) from BOARD_TBL;










