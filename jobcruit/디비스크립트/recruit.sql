



create table tb_recruit(
rno int(11) auto_increment primary key, 
cid int(11) not null,
title varchar(200) not null, 
career varchar(100) not null, 
edu_level varchar(50) not null, 
prefer varchar(500) not null, 
hire_type varchar(100) not null, 
recruit_info varchar(500) not null,
position varchar(30) not null
);



insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('samsung', '삼성sds 신입 및 경력직 채용', '신입 및 3년차', '고졸', '자바, 스프링, jsp','정규직', '회사규정에의한지급^역삼^09:00~18:00^개발자', '사원 및 대리');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('LG', 'LG개발 신입 채용', '신입', '대졸', '자바, 자바스크립트, Ajax','계약직', '초봉3800^역삼^09:00~18:00^개발및 유지보수', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('FaceBook', '페이스북코리아 정식직원 채용 공고', '신입', '대졸', '커뮤니케이션능력이 좋은 사람, 자바기초가 있는 사람','정규직', '회사규정에 의한 급여^강남^09:00~18:00^솔루션 개발', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('samsung22', '삼성sds 신입 및 경력직 채용', '신입 및 3년차', '고졸', '자바, 스프링, jsp','정규직', '회사규정에의한지급^역삼^09:00~18:00^개발자', '사원 및 대리');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('LG22', 'LG개발 신입 채용', '신입', '대졸', '자바, 자바스크립트, Ajax','계약직', '초봉3800^역삼^09:00~18:00^개발및 유지보수', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('FaceBook22', '페이스북코리아 정식직원 채용 공고', '신입', '대졸', '커뮤니케이션능력이 좋은 사람, 자바기초가 있는 사람','정규직', '회사규정에 의한 급여^강남^09:00~18:00^솔루션 개발', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('samsung33', '삼성sds 신입 및 경력직 채용', '신입 및 3년차', '고졸', '자바, 스프링, jsp','정규직', '회사규정에의한지급^역삼^09:00~18:00^개발자', '사원 및 대리');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('LG33', 'LG개발 신입 채용', '신입', '대졸', '자바, 자바스크립트, Ajax','계약직', '초봉3800^역삼^09:00~18:00^개발및 유지보수', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('FaceBook33', '페이스북코리아 정식직원 채용 공고', '신입', '대졸', '커뮤니케이션능력이 좋은 사람, 자바기초가 있는 사람','정규직', '회사규정에 의한 급여^강남^09:00~18:00^솔루션 개발', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('samsung44', '삼성sds 신입 및 경력직 채용', '신입 및 3년차', '고졸', '자바, 스프링, jsp','정규직', '회사규정에의한지급^역삼^09:00~18:00^개발자', '사원 및 대리');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('LG44', 'LG개발 신입 채용', '신입', '대졸', '자바, 자바스크립트, Ajax','계약직', '초봉3800^역삼^09:00~18:00^개발및 유지보수', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('FaceBook44', '페이스북코리아 정식직원 채용 공고', '신입', '대졸', '커뮤니케이션능력이 좋은 사람, 자바기초가 있는 사람','정규직', '회사규정에 의한 급여^강남^09:00~18:00^솔루션 개발', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('samsung55', '삼성sds 신입 및 경력직 채용', '신입 및 3년차', '고졸', '자바, 스프링, jsp','정규직', '회사규정에의한지급^역삼^09:00~18:00^개발자', '사원 및 대리');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('LG55', 'LG개발 신입 채용', '신입', '대졸', '자바, 자바스크립트, Ajax','계약직', '초봉3800^역삼^09:00~18:00^개발및 유지보수', '사원');

insert into tb_recruit (cid, title,career,edu_level,prefer,hire_type ,recruit_info, position)
values('FaceBook55', '페이스북코리아 정식직원 채용 공고', '신입', '대졸', '커뮤니케이션능력이 좋은 사람, 자바기초가 있는 사람','정규직', '회사규정에 의한 급여^강남^09:00~18:00^솔루션 개발', '사원');

select * from tb_recruit;
drop table tb_recruit;