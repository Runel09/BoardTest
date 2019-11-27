package web.dto;


public class Member {

   private int User_Num;
   private String DB_Email;
   private String DB_Id;
   private String DB_Pw;
   private String DB_Name;
   private String DB_Nick;
   private int DB_Gender;
   private String DB_Addr;
   private String DB_Addr_detail;
   private String DB_Mailnum;
   private String DB_Birth;
   private String DB_Phnum;
   
   public int getUser_Num() {
      return User_Num;
   }
   public void setUser_Num(int user_Num) {
      User_Num = user_Num;
   }
   public String getDB_Email() {
      return DB_Email;
   }
   public void setDB_Email(String dB_Email) {
      DB_Email = dB_Email;
   }
   public String getDB_Id() {
      return DB_Id;
   }
   public void setDB_Id(String dB_Id) {
      DB_Id = dB_Id;
   }
   public String getDB_Pw() {
      return DB_Pw;
   }
   public void setDB_Pw(String dB_Pw) {
      DB_Pw = dB_Pw;
   }
   public String getDB_Name() {
      return DB_Name;
   }
   public void setDB_Name(String dB_Name) {
      DB_Name = dB_Name;
   }
   public String getDB_Nick() {
      return DB_Nick;
   }
   public void setDB_Nick(String dB_Nick) {
      DB_Nick = dB_Nick;
   }
   public int getDB_Gender() {
      return DB_Gender;
   }
   public void setDB_Gender(int dB_Gender) {
      DB_Gender = dB_Gender;
   }
   public String getDB_Addr() {
      return DB_Addr;
   }
   public void setDB_Addr(String dB_Addr) {
      DB_Addr = dB_Addr;
   }
   public String getDB_Addr_detail() {
      return DB_Addr_detail;
   }
   public void setDB_Addr_detail(String dB_Addr_detail) {
      DB_Addr_detail = dB_Addr_detail;
   }
   public String getDB_Mailnum() {
      return DB_Mailnum;
   }
   public void setDB_Mailnum(String dB_Mailnum) {
      DB_Mailnum = dB_Mailnum;
   }
   public String getDB_Birth() {
      return DB_Birth;
   }
   public void setDB_Birth(String dB_Birth) {
      DB_Birth = dB_Birth;
   }
   public String getDB_Phnum() {
      return DB_Phnum;
   }
   public void setDB_Phnum(String dB_Phnum) {
      DB_Phnum = dB_Phnum;
   }
   @Override
   public String toString() {
      return "member [User_Num=" + User_Num + ", DB_Email=" + DB_Email + ", DB_Id=" + DB_Id + ", DB_Pw=" + DB_Pw
            + ", DB_Name=" + DB_Name + ", DB_Nick=" + DB_Nick + ", DB_Gender=" + DB_Gender + ", DB_Addr=" + DB_Addr
            + ", DB_Addr_detail=" + DB_Addr_detail + ", DB_Mailnum=" + DB_Mailnum + ", DB_Birth=" + DB_Birth
            + ", DB_Phnum=" + DB_Phnum + "]";
   }
   
}