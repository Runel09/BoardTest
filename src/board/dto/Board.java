package board.dto;

public class Board {
	boardno NUMBER primary key, -- 글번호
	title VARCHAR2(500), -- 제목
	id VARCHAR2(100), -- 작성자 아이디
	content VARCHAR2(4000), -- 본문
	hit NUMBER, -- 조회수
	writtendate DATE DEFAULT sysdate -- 최초작성일
}
