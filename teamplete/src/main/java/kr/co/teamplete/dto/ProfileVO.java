package kr.co.teamplete.dto;

public class ProfileVO {

	private String pMemberid;
	private String fileNameKey, fileName, filePath, fileSize, insDate;
	private char delYN;
	
	public ProfileVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProfileVO(String pMemberid, String fileNameKey, String fileName, String filePath, String fileSize,
			String insDate, char delYN) {
		super();
		this.pMemberid = pMemberid;
		this.fileNameKey = fileNameKey;
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
		this.insDate = insDate;
		this.delYN = delYN;
	}

	public String getpMemberid() {
		return pMemberid;
	}

	public void setpMemberid(String pMemberid) {
		this.pMemberid = pMemberid;
	}

	public String getFileNameKey() {
		return fileNameKey;
	}

	public void setFileNameKey(String fileNameKey) {
		this.fileNameKey = fileNameKey;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getInsDate() {
		return insDate;
	}

	public void setInsDate(String insDate) {
		this.insDate = insDate;
	}

	public char getDelYN() {
		return delYN;
	}

	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}

	@Override
	public String toString() {
		return "ProfileVO [pMemberid=" + pMemberid + ", fileNameKey=" + fileNameKey + ", fileName=" + fileName
				+ ", filePath=" + filePath + ", fileSize=" + fileSize + ", insDate=" + insDate + ", delYN=" + delYN
				+ "]";
	}

	
}
