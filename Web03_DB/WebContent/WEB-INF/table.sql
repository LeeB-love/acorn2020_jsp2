-- 방명록 글을 저장할 테이블
	create table board_guest(
		num number primary key,
		writer varchar2(50) not null,
		title varchar2(100) not null,
		content clob,
		regdate date
	);
	
-- 방명록 테이블에 글번호를 생성하는 시퀀스
	create sequence board_guest_seq;