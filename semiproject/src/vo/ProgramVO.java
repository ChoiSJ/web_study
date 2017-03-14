package vo;


public class ProgramVO {
	private int programNo;
	private String programName;
	private String artistName;
	private String programDate;
	private int crowdnumber;
	private String programDescription;
	private String photofile;
	private String announceDate;
	private String isVisible;
	private String mainphotoFile;
	
	public ProgramVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getMainphotoFile() {
		return mainphotoFile;
	}


	public void setMainphotoFile(String mainphotoFile) {
		this.mainphotoFile = mainphotoFile;
	}


	public int getProgramNo() {
		return programNo;
	}

	public void setProgramNo(int programNo) {
		this.programNo = programNo;
	}

	public String getProgramName() {
		return programName;
	}

	public void setProgramName(String programName) {
		this.programName = programName;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}



	public String getProgramDate() {
		return programDate;
	}

	public void setProgramDate(String programDate) {
		this.programDate = programDate;
	}

	public int getCrowdnumber() {
		return crowdnumber;
	}

	public void setCrowdnumber(int crowdnumber) {
		this.crowdnumber = crowdnumber;
	}

	public String getProgramDescription() {
		return programDescription;
	}

	public void setProgramDescription(String programDescription) {
		this.programDescription = programDescription;
	}

	public String getPhotofile() {
		return photofile;
	}

	public void setPhotofile(String photofile) {
		this.photofile = photofile;
	}

	public String getAnnounceDate() {
		return announceDate;
	}

	public void setAnnounceDate(String announceDate) {
		this.announceDate = announceDate;
	}
	
	public String getIsVisible() {
		return isVisible;
	}
	
	public void setIsVisible(String isVisible) {
		this.isVisible = isVisible;
	}
}
