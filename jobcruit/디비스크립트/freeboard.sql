-- 자유게시판 테이블 생성
create table tb_freeboard(
	fno int auto_increment primary key,
    title varchar(40) not null,
    content text not null,
    mno int(11) not null,
    reg_date timestamp not null default now(),
    modi_date timestamp not null default now(),
    read_count int not null default 0,
    comm_count int not null default 0,
    isattach tinyint(1) not null default 0,
    constraint fk_free_mno foreign key (mno) references tb_member (mno) on delete restrict
);

-- 자유게시판 첨부 테이블 생성
create table tb_free_attach(
	fno int auto_increment primary key,
    file_path varchar(200) not null,
    file_name varchar(100) not null,
	constraint fk_free_attach_fno foreign key (fno) references tb_freeboard (fno) on delete restrict
);

-- 자유게시판 댓글 테이블 생성
create table tb_free_comment(
	free_cno int auto_increment primary key,
    fno int not null,
    mno int not null,
    content text not null,
    reg_date timestamp not null default now(),
    constraint fk_free_comm_mno foreign key (mno) references tb_member (mno) on delete restrict,
    constraint fk_free_comm_fno foreign key (fno) references tb_freeboard (fno) on delete restrict
);


-- 테이블 삭제
drop table tb_free_comment;
drop table tb_free_attach;
drop table tb_freeboard;


-- 
select * from tb_freeboard order by fno desc;
