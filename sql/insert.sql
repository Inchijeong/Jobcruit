-- 치정 멤버

insert into tb_member(email, mname, phone_no, password, category)
values('won@naver.com', '원나현', '01011112222', '1234', 0);
insert into tb_member(email, mname, phone_no, password, category)
values('in@naver.com', '인치정', '01011112222', '1234', 0);
insert into tb_member(email, mname, phone_no, password, category)
values('youn@naver.com', '윤다영', '01011112222', '1234', 1);
insert into tb_member(email, mname, phone_no, password, category)
values('pak@naver.com', '박현준', '01011112222', '1234', 1);

insert into tb_fav_recruit (mno, rno)
values(1, 1);
insert into tb_fav_recruit (mno, rno)
values(1, 2);
insert into tb_fav_recruit (mno, rno)
values(1, 3);
insert into tb_fav_recruit (mno, rno)
values(2, 1);
insert into tb_fav_recruit (mno, rno)
values(2, 3);
insert into tb_fav_recruit (mno, rno)
values(3, 3);
insert into tb_fav_recruit (mno, rno)
values(3, 4);
insert into tb_fav_recruit (mno, rno)
values(4, 7);

-- 다영

insert into tb_review (cid, grade, title, merit, weakness)
values ( 175, 3.8, '빙그레 경영정보원 현직자', '아이스크림과 바나나우유는 항상 비치되어 있습니다!', '공장 서버가 다운되면 지방으로 바로 출발해야하는 불편함.....');
insert into tb_review (cid, grade, title, merit, weakness)
values ( 175, 4.3, '빙그레 경영정보원 현직자', '바나나우유 무한 리필', '가끔 공장이 번개를 맞아여');
insert into tb_review (cid, grade, title, merit, weakness)
values ( 174, 4.0, '교보문고 웹 개발자', '일과 일상의 구분이 확실함', '근무지가 너무 멀어여,,,,파주임');


