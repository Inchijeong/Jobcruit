create table tb_member(
	mno int(11) auto_increment primary key,
    email varchar(40) not null,
    mname varchar(30) not null,
    phone_no varchar(11) not null,
    password varchar(20) not null,
    category Tinyint(1) default 0 -- 0은 개인 / 1은 기업
);

select * from tb_member;

drop table tb_member;




