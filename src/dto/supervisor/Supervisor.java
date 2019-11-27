package dto.supervisor;

public class Supervisor {

	private String super_id;
	private String super_pw;
	
	public String getSuper_id() {
		return super_id;
	}
	public void setSuper_id(String super_id) {
		this.super_id = super_id;
	}
	public String getSuper_pw() {
		return super_pw;
	}
	public void setSuper_pw(String super_pw) {
		this.super_pw = super_pw;
	}
	@Override
	public String toString() {
		return "Supervisor [super_id=" + super_id + ", super_pw=" + super_pw + "]";
	}
}
