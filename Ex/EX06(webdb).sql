CREATE TABLE author (
    author_id     number(10),
    author_name   varchar2(100) not null,
    author_desc   varchar2(500),
    primary key (author_id)
    ); 
    -- ORA-00907 날경우 우괄호 오류 
    
    
insert into author 
values (1, '박경리', '토지작가');

insert into author(author_id, author_name)
values (2, '이문열');

insert into author(author_name,author_id)
values ('기안84',3);

insert into author(author_id)
value(4);-- 이름이 없어서 오류 뜸 (NOT NULL은 값이 있어야함)

SELECT
    * FROM author;
    
  
    
create table book(
    book_id number(10),
    title varchar2(100) not null, 
    pubs varchar2(100),
    pub_date DATE,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id)
    references author(author_id)
);

SELECT
    * FROM book;
    
-- 1. 토지, 마로니에북스, 2012-08-15,1
insert into book
values(1,'토지','마로니에북스','2012-08-15',1);



-- 2, 삼국지, 민음사 , 2002-03-01, 2 
insert into book
values(2, '삼국지', '민음사', '2002-03-01', 2);

-- 수정
update author 
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id =1;

update author 
set author_name = '기안84',
    author_desc = '웹툰작가';

SELECT
    * FROM author;
    
delete from author
where author_id = 3;


delete from book;-- 행 삭제 

delete from author; 

drop table book; -- table 전체 삭제 



drop table book;
drop table author;

/**********시퀀스 sequence
*******************************/

create table book(
book_id number(10),
title varchar2(100) not null,
pubs varchar2(500),
primary key(book_id)
);

-- 작가 시퀀스 만들기 
create sequence seq_author_id
increment by 1 
start with 1
nocache;

insert into author
values(seq_author_id.nextval,'박경리','토지작가');

insert into author
values(seq_author_id.nextval,'이문열','삼국지');

insert into author
values(seq_author_id.nextval,'기안84','웹툰작가');

insert into author
values(seq_author_id.nextval,'김려경','java'); -- nextval로 번호 올라감 

insert into author
values(seq_author_id.nextval,'유재석','연예인');

SELECT
    * FROM author;

select * 
from user_sequences;

select seq_author_id.currval
from dual;

select seq_author_id.nextval
from dual;-- 번호올라가버림 

drop sequence seq_author_id;-- ORA-00950 알파벳 틀림 오류 

rollback; -- ctrl + z 

commit; -- save 

insert into author
values(seq_author_id.nextval, '이효리','가수');

-- 작가 테이블 삭제 
drop table author;

-- 시퀀스 삭제 
drop sequence seq_author1_id;

-- 작가 테이블 만들기
create table author1(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);
-- 작가 시퀀스 만들기 
create sequence seq_author1_id
increment by 1 
start with 1 
nocache;


-- 작가 데이터 추가 
insert into author1
values(seq_author1_id.nextval, '박경리','토지작가');

insert into author1
values(seq_author1_id.nextval, '이문열','삼국지작가');

insert into author1
values(seq_author1_id.nextval, '기안84','웹툰작가');

update author1
set author_name = '자취84',
    author_desc = '나혼자산다 출연'
where author_id = 3;


drop table author1;
drop table book;
drop table author;
drop sequence seq_book_id;
drop sequence seq_author_id;
-- 작가테이블 조회하기
select * 
from book;

select * 
from author;
