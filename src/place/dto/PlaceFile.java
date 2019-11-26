package place.dto;

public class PlaceFile {
	private int fileno;
	private int place_number;
	private String originname;
	private String storedname;
	private int filesize;
	@Override
	public String toString() {
		return "PlaceFile [fileno=" + fileno + ", place_number=" + place_number + ", originname=" + originname
				+ ", storedname=" + storedname + ", filesize=" + filesize + "]";
	}
	public int getFileno() {
		return fileno;
	}
	public void setFileno(int fileno) {
		this.fileno = fileno;
	}
	public int getPlace_number() {
		return place_number;
	}
	public void setPlace_number(int place_number) {
		this.place_number = place_number;
	}
	public String getOriginname() {
		return originname;
	}
	public void setOriginname(String originname) {
		this.originname = originname;
	}
	public String getStoredname() {
		return storedname;
	}
	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
	
	
}
