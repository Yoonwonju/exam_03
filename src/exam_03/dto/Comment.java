package exam_03.dto;

import java.sql.Timestamp;

public class Comment {
	private int idx;
	private int bidx;
	private String writer;
	private String content;
	private Timestamp regDate;

	@Override
	public String toString() {
		return "Comment [idx=" + idx + ", bidx=" + bidx + ", writer=" + writer + ", content=" + content + ", regDate="
				+ regDate + "]";
	}

	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(int idx, int bidx, String writer, String content, Timestamp regDate) {
		super();
		this.idx = idx;
		this.bidx = bidx;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}

	public Comment(int idx) {
		super();
		this.idx = idx;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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
