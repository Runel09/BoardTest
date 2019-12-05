package dto.login;


public class Member {

 
private int user_number;
   private String user_email;
   private String user_id;
   private String user_pw;
   private String user_name;
   private String user_nick;
   private int user_gender;
   private String user_addr;
   private String user_addr_detail;
   private String user_mailnum;
   private String user_birth;
   private String user_phnum;

   
   
public int getUser_number() {
	return user_number;
}

public void setUser_number(int user_number) {
	this.user_number = user_number;
}
public String getUser_email() {
	return user_email;
}
public void setUser_email(String user_email) {
	this.user_email = user_email;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getUser_pw() {
	return user_pw;
}
public void setUser_pw(String user_pw) {
	this.user_pw = user_pw;
}
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public String getUser_nick() {
	return user_nick;
}
public void setUser_nick(String user_nick) {
	this.user_nick = user_nick;
}
public int getUser_gender() {
	return user_gender;
}
public void setUser_gender(int user_gender) {
	this.user_gender = user_gender;
}
public String getUser_addr() {
	return user_addr;
}
public void setUser_addr(String user_addr) {
	this.user_addr = user_addr;
}
public String getUser_addr_detail() {
	return user_addr_detail;
}
public void setUser_addr_detail(String user_addr_detail) {
	this.user_addr_detail = user_addr_detail;
}
public String getUser_mailnum() {
	return user_mailnum;
}
public void setUser_mailnum(String user_mailnum) {
	this.user_mailnum = user_mailnum;
}
public String getUser_birth() {
	return user_birth;
}
public void setUser_birth(String user_birth) {
	this.user_birth = user_birth;
}
public String getUser_phnum() {
	return user_phnum;
}
public void setUser_phnum(String user_phnum) {
	this.user_phnum = user_phnum;
}
@Override
public String toString() {
	return "Member [user_number=" + user_number + ", user_email=" + user_email + ", user_id=" + user_id + ", user_pw="
			+ user_pw + ", user_name=" + user_name + ", user_nick=" + user_nick + ", user_gender=" + user_gender
			+ ", user_addr=" + user_addr + ", user_addr_detail=" + user_addr_detail + ", user_mailnum=" + user_mailnum
			+ ", user_birth=" + user_birth + ", user_phnum=" + user_phnum + "]";
}
   
 






   
}