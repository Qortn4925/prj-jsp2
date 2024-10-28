use jsp2;



create table board
(
    id       INT PRIMARY KEY auto_increment,
    title    varchar(200)  not null,
    content  varchar(5000) not null,
    writer   varchar(200)  not null,
    inserted DATETIME      not null default NOW()
);


select *
from jsp2.board;

insert into board
values (1, '제목', '내용입니다', '작성자');