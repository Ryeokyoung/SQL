/*******실습 **********/
---테이블 조회하기
select * 
from book;
 
 create table author(
 author_id number(10),
 author_name varchar2 (500) not null,
 author_desc varchar2 (500),
 primary key(author_id));
 
 create table book(
 book_id number(10),
 title varchar2(1000) not null, 
 pubs varchar2(500),
 pub_date DATE,
 author_id number(10),
 primary key(book_id),
 constraint book_fk foreign key(author_id)
 references author(author_id)
 );
 
 create sequence seq_book_id
 increment by 1 
 start with 1;
 
 create sequence seq_author_id
 increment by 1 
 start with 1;
 
 insert into author 
 values (seq_author_id.nextval, '김문열', '경북영양');
 
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

 select *
 from author;

 delete from author
 where author_id = 7;
 
 insert into book ( book_id, title, pubs, pub_date, author_id)
 values (1,'우리들의 일그러진영웅', '다림', '1998-02-22', 1  );
 
 insert into book ( book_id, title, pubs, pub_date, author_id)
 values (2,'삼국지', '민음사', '2002-03-01',1  );
 
 insert into book ( book_id, title, pubs, pub_date, author_id)
 values (3,'토지', '마로니에북스', '2012-08-15',2  );
 
 insert into book ( book_id, title, pubs, pub_date, author_id)
 values (4,'유시민의 글쓰기특강', '생각의길', '2015-04-01',3  );
 
 insert into book ( book_id, title, pubs, pub_date, author_id)
 values (5,'패션왕', '중앙북스(books)', '2012-02-22',4  );
 
 insert into book ( book_id, title, pubs, pub_date, author_id)
 values (6,'순정만화', '재미주의', '2011-08-03',5  );
 
  insert into book ( book_id, title, pubs, pub_date, author_id)
 values (7, '오직두사람', '문학동네', '2017-05-04',6  );
 
  insert into book ( book_id, title, pubs, pub_date, author_id)
 values (8,'26년', '재미주의', '2012-02-04',5  );
 
  select *
 from book;

update author
set author_name = '강풀',
    author_desc = '서울특별시'
 where author_id = 5;

SELECT  b.book_id,
        b.title,
        b.pubs,
        b.pub_date,
        b.author_id,
        a.author_name,
        a.author_desc
FROM book b, author a 
where b.author_id = a.author_id;