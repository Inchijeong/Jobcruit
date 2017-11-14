-- 회원 테이블 생성
create table tb_member(
  mno int auto_increment primary key UNIQUE,
  email varchar(40) not null,
  mname varchar(30) not null,
  phone_no varchar(11) not null,
  password varchar(20) not null,
  category Tinyint(1) default 0 -- 0은 개인 / 1은 기업
);

-- 회원 테이블 삭제
drop table tb_member;

-- 회원 데이터 조회
select * from tb_member;