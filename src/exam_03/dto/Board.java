package exam_03.dto;

import java.sql.Timestamp;

public class Board {
	private int idx;
	private String writer;
	private String subject;
	private String content;
	private Timestamp regDate;

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int idx, String writer, String subject, String content) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}

	public Board(String writer, String subject, String content) {
		super();
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}

	public Board(int idx, String writer, String subject, String content, Timestamp regDate) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.regDate = regDate;
	}

	public Board(int idx) {
		super();
		this.idx = idx;
	}

	@Override
	public String toString() {
		return "Board [idx=" + idx + ", writer=" + writer + ", subject=" + subject + ", content=" + content
				+ ", regDate=" + regDate + "]";
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

}
