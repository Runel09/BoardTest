package user.dto;

public class User {
	private int User_num;
	private String USERID;
	private String USERPW;
	private String USERName;
	private String Nick;
	private int Gender;
	private String Email;
	private String Addr;
	private String Address_detail;
	private String Mailnum;
	private String Birthday;
	private String Phonenum;
	public int getUser_num() {
		return User_num;
	}
	@Override
	public String toString() {
		return "User [User_num=" + User_num + ", USERID=" + USERID + ", USERPW=" + USERPW + ", USERName=" + USERName
				+ ", Nick=" + Nick + ", Gender=" + Gender + ", Email=" + Email + ", Addr=" + Addr + ", Address_detail="
				+ Address_detail + ", Mailnum=" + Mailnum + ", Birthday=" + Birthday + ", Phonenum=" + Phonenum + "]";
	}
	public void setMailnum(String mailnum) {
		Mailnum = mailnum;
	}
	public void setBirthday(String birthday) {
		Birthday = birthday;
	}
	public void setPhonenum(String phonenum) {
		Phonenum = phonenum;
	}
	public void setUser_num(int user_num) {
		User_num = user_num;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getUSERPW() {
		return USERPW;
	}
	public void setUSERPW(String uSERPW) {
		USERPW = uSERPW;
	}
	public String getUSERName() {
		return USERName;
	}
	public void setUSERName(String uSERName) {
		USERName = uSERName;
	}
	public String getNick() {
		return Nick;
	}
	public void setNick(String nick) {
		Nick = nick;
	}
	public int getGender() {
		return Gender;
	}
	public void setGender(int gender) {
		Gender = gender;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAddr() {
		return Addr;
	}
	public void setAddr(String addr) {
		Addr = addr;
	}
	public String getAddress_detail() {
		return Address_detail;
	}
	public void setAddress_detail(String address_detail) {
		Address_detail = address_detail;
	}
	public String getMailnum() {
		return Mailnum;
	}
	public String getBirthday() {
		return Birthday;
	}
	public String getPhonenum() {
		return Phonenum;
	}

	
}