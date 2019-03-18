-- 기업 테이블 생성
CREATE TABLE tb_company (
  `cid` int auto_increment primary key,
  `cname` VARCHAR(50) NOT NULL,
  `company_info` VARCHAR(500) NOT NULL,
  `homepage` VARCHAR(255),
  `latitude` DOUBLE,
  `longitude` DOUBLE,
  `logo` VARCHAR(300),
  `mno` int NOT NULL
);

-- 재직자 리뷰 테이블 생성
CREATE TABLE tb_review (
  `rvno` INT auto_increment primary key, 
  `cid` INT NOT NULL,
  `grade` DOUBLE NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `merit` TEXT NOT NULL,
  `weakness` TEXT NOT NULL
  );
  
  
  select * 
  from tb_company;
  
  select * 
  from tb_review;
  
  
  
  
  
  
  drop table tb_company;
  drop table tb_company;
  
  
  
  
  
  
  insert into tb_company(cname, company_info, homepage, address, logo, mno)
  values ('삼성전자', '이동전화기 제조업/98,080명/1969년 1월 13일/대기업', 'www.samsung.com', '경기도 수원시 영통구 매탄3동 416', 'Samsung.png', 1);
  insert into tb_company(cname, company_info, homepage, address, logo, mno)
  values ('LG CNS', '컴퓨터 프로그래밍 서비스업/5,704명/1987년 1월 14일/계열사', 'www.lgcns.com', '서울특별시 마포구 상암동 1591', 'lg.jpg', 2);
  insert into tb_company(cname, company_info, homepage, address, logo, mno)
  values ('삼성 SDS', '컴퓨터 프로그래밍 서비스업/12,991명/1985년 5월 1일/계열사', 'www.samsungsds.com', '서울특별시 송파구 잠실6동 7-13', 'samsungsds.jpg', 1);
  insert into tb_company(cname, company_info, homepage, address, logo, mno)
  values ('카카오', '포털 및 기타 인터넷 정보매개 서비스업/2,689명/1995년 2월 16일/중견기업', 'www.kakaocorp.com', '제주특별자치도 제주시 영평동 2181', 'kakao.png', 3);
  insert into tb_company(cname, company_info, homepage, address, logo, mno)
  values ('네이버', '포털 및 기타 인터넷 정보매개 서비스업/2,531명/1999년 6월 2일/중견기업', 'www.navercorp.com', '경기도 성남시 분당구 정자동 178-1', 'naver.jpg', 4);
  insert into tb_company(cname, company_info, homepage, address, logo, mno)
  values ('교보문고', '도서,컴퓨터,문구류 소매/출판 등 서적 및 잡지류 소매업체/1,040명/1980년 12월 24일/중견기업', 'www.kyobobook.co.kr', '경기도 파주시 문발동 501-1', 'kyobo.png', 5);
  insert into tb_company(cname, company_info, homepage, address, logo, mno)
  values ('빙그레', '아이스크림 및 기타 식용빙과류 제조업/1,843명/1967년 9월 13일/중견기업', 'www.bing.co.kr', '경기도 남양주시 도농동 344-3', 'bing.png', 6);
  
  
  
  insert into tb_review(cid, grade, title, merit, weakness)
  values (1, 4.4, '개발자 뽑음', '돈 많이줌', '돈 쓸시간이 노노함');
  insert into tb_review(cid, grade, title, merit, weakness)
  values (2, 4.4, 'cns 신입 공채', '돈 많이줌', '돈 쓸시간이 노노함');
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  