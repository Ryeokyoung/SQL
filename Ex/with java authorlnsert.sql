-- webdb page SQL 

-- 삭제 
drop table author;
drop sequence seq_author_id;


-- 테이블 생성 
CREATE TABLE author (
    author_id     number(10),
    author_name   varchar2(100) not null,
    author_desc   varchar2(500),
    primary key (author_id)
    ); 
   
-- 작가 시퀀스 만들기 
create sequence seq_author_id
increment by 1 
start with 1
nocache;


-- author 데이터 입력 
 insert into author 
 values (seq_author_id.nextval, '이문열', '경북영양3');
 
select * from
author;


rollback;
 
 
 -------------------------
 
insert into author 
 values (seq_author_id.nextval, '박경리', '경상남도 통영');
 
 insert into author 
 values (seq_author_id.nextval, '유시민', '17대 국회의원');

insert into author 
 values (seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
 
 insert into author 
 values (seq_author_id.nextval, '강풀', '온라인 만화가 1세대');
 
 insert into author 
 values (seq_author_id.nextval, '김영하', '알쓸신잡');

 insert into author 
 values (seq_author_id.nextval, '강풀', '온라인 만화가 1세대');
