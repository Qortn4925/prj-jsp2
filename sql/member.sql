use jsp2;

create table member
(
    id          VARCHAR(50) primary key,
    password    VARCHAR(100) not null,
    nick_name   varchar(100) not null UNIQUE,
    description VARCHAR(2000),
    inserted    DATETIME     not null default now()
);
#  도부이,    부분함수 종속 , 이행함수 종속 ,

select *
from member;


CREATE TABLE auth
(
    id   VARCHAR(50) REFERENCES member (id),
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id, name)
);

INSERT INTO auth
    (id, name)
VALUES ('admin', 'admin'),
       ('bdmin', 'admin');

select *
from auth;