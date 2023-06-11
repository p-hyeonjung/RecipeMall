package recipeMall.notice;

import java.sql.Date;

public class NoticeVO {
	private int noticeNo;
	private String adminId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	
	public NoticeVO() {
		
	}

	public NoticeVO(int noticeNo, String adminId, String noticeTitle, String noticeContent) {
		this.noticeNo = noticeNo;
		this.adminId = adminId;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	public NoticeVO(int noticeNo, String adminId, String noticeTitle, String noticeContent, Date noticeDate) {
		this(noticeNo, adminId, noticeTitle, noticeContent);
		this.noticeDate=noticeDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	
	
}
