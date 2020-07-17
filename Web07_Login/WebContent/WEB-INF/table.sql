-- 사용자(회원) 정보를 저장할 테이블
create table users(
	id varchar2(100) primary key,
	pwd varchar2(100) not null,
	email varchar2(100),
	profile varchar2(100), -- 프로필 이미지 경로를 저장할 칼럼
	regdate date
);


-- upload된 파일의 정보를 저장할 테이블 --
CREATE TABLE board_file(
   num number primary key,
   writer varchar2(100) not null,
   title varchar2(100) not null,
   orgFileName varchar2(100) not null, -- 원본 파일명
   saveFileName varchar2(100) not null, -- 서버에 저장된 파일명
   -- (나눠서 저장하는 이유: 서로 다른 여러 사람이 올린 파일을 중복되지 않게 저장하기 위함)
   fileSize number not null,
   regdate date
);

create sequence board_file_seq;