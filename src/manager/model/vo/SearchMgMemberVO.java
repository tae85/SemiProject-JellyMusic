package manager.model.vo;

import java.sql.Date;


//create table member(
//mem_id varchar2(30) ,
//mem_pwd varchar2(30) not null,
//mem_name varchar2(30) unique not null,
//mem_addr varchar2(90) not null,
//mem_email varchar2(30) not null,
//mem_phone number(11) not null,
//mem_sns char(1) not null,
//mem_name varchar2(30) not null,
//mem_birth date not null,
//mem_reg_date date default sysdate,
//mem_wd_date date,
//CONSTRAINT PK_MEMID PRIMARY KEY (mem_id),
//CONSTRAINT CHK_SNS CHECK (mem_sns IN (0, 1))

public class SearchMgMemberVO {
	private String mem_id;
	private String mem_pwd;
	private String mem_addr;
	private String mem_email;
	private int mem_phone;
	private Character mem_sns;
	private String mem_name;
	private Date mem_birth;
	private Date mem_reg_date;
	private Date mem_wd_date;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public int getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(int mem_phone) {
		this.mem_phone = mem_phone;
	}
	public Character getMem_sns() {
		return mem_sns;
	}
	public void setMem_sns(Character mem_sns) {
		this.mem_sns = mem_sns;
	}
	public Date getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}
	public Date getMem_reg_date() {
		return mem_reg_date;
	}
	public void setMem_reg_date(Date mem_reg_date) {
		this.mem_reg_date = mem_reg_date;
	}
	public Date getMem_wd_date() {
		return mem_wd_date;
	}
	public void setMem_wd_date(Date mem_wd_date) {
		this.mem_wd_date = mem_wd_date;
	}
	
	
			
}
