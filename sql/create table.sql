-- 나현

-- 자유게시판 테이블 생성
create table tb_freeboard(
	fno int auto_increment primary key,
  title varchar(40) not null,
  content text not null,
  mno int not null,
  reg_date timestamp not null default now(),
  modi_date timestamp not null default now(),
  read_count int not null default 0,
  comm_count int not null default 0,
  isattach tinyint(1) not null default 0
);

-- 자유게시판 첨부 테이블 생성
create table tb_free_attach(
   free_ano int auto_increment primary key,
   fno int not null,
  file_name varchar(100) not null
);

-- 자유게시판 댓글 테이블 생성
create table tb_free_comment(
	free_cno int auto_increment primary key,
  fno int not null,
  mno int not null,
  content text not null,
  reg_date timestamp not null default now()
);


-- 다영

-- 기업 테이블 생성
CREATE TABLE tb_company (
  cid int auto_increment primary key,
  cname VARCHAR(50) NOT NULL,
  company_info VARCHAR(500) NOT NULL,
  homepage VARCHAR(255),
  latitude DOUBLE,
  longitude DOUBLE,
  logo VARCHAR(300),
  mno int NOT NULL
);

-- 재직자 리뷰 테이블 생성
CREATE TABLE tb_review (
  rvno INT auto_increment primary key, 
  cid INT NOT NULL,
  grade DOUBLE NOT NULL,
  title VARCHAR(100) NOT NULL,
  merit TEXT NOT NULL,
  weakness TEXT NOT NULL
);


-- 치정

-- 회원 테이블 생성
create table tb_member(
  mno int auto_increment primary key,
	email varchar(40) not null,
	mname varchar(30) not null,
	phone_no varchar(11) not null,
	password varchar(20) not null,
	category Tinyint(1) default 0 -- 0은 개인 / 1은 기업
);

-- 이력서 테이블 생성
CREATE TABLE tb_cv (
  cv_ano int auto_increment primary key,
  mno INT NOT NULL,
  file_path VARCHAR(200) NOT NULL,
  file_name VARCHAR(100) NOT NULL,
  title VARCHAR(40) NOT NULL,
  reg_date TIMESTAMP default now()
  );
  
-- 관심 채용 테이블 생성
CREATE TABLE tb_fav_recruit (
	mno INT NOT NULL,
	rno INT NOT NULL,
  reg_date timestamp default now()
);
 

-- 현준
  
-- 채용 테이블 생성
create table tb_recruit(
	rno int auto_increment primary key, 
	cid int not null,
	title varchar(200) not null, 
	career varchar(100) not null, 
	edu_level varchar(50) not null, 
	prefer varchar(500) not null, 
	hire_type varchar(100) not null,
	eligibility varchar(500) not null,
	recruit_info varchar(500) not null,
	position varchar(30) not null
);