
CREATE TABLE tb_company (
  `cid` int(5) auto_increment primary key NOT NULL,
  `cname` VARCHAR(50) NOT NULL,
  `company_info` VARCHAR(500) NOT NULL,
  `homepage` VARCHAR(255),
  `latitude` DOUBLE,
  `longitude` DOUBLE,
  `logo` VARCHAR(300),
  `mno` int(5) NOT NULL
);

CREATE TABLE tb_review (
  `cid` INT(5) primary key NOT NULL,
  `grade` DOUBLE NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `merit` TEXT NOT NULL,
  `weakness` TEXT NOT NULL
  );


CREATE TABLE tb_cv (
  `mno` VARCHAR(5) primary key,
  `file_path` VARCHAR(200) NOT NULL,
  `file_name` VARCHAR(100) NOT NULL,
  `title` VARCHAR(40) NOT NULL,
  `reg_date` TIMESTAMP NOT NULL
  );
  
CREATE TABLE tb_fav_recruit (
`mno` VARCHAR(5) primary key not NULL,
`rno` VARCHAR(5) NOT NULL
);

  
drop table tb_review;