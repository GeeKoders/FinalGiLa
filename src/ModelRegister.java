

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

public class ModelRegister {
	
	private String email;
	private String name;
	private String sex;
	private String location;
	private String password;
	
    Connection conn;
    Statement stmt;
    ResultSet rs;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public ModelRegister(String e,String n,String s,String l,String p){
		this.email=e;
		this.name=n;
		this.sex=s;
		this.location=l;
		this.password=p;
		
		try{
			MyDBDriver db = new MyDBDriver();
			System.out.println("connect success!!");
			conn=db.getConnection();
			stmt=conn.createStatement();
			
			stmt.executeUpdate("insert into �瑼�(�撣唾�,��梁迂,�批,撅�蝮��,撖Ⅳ,����駁���) " 
						+"values('"+email+"', '"+name+"','"+sex+"','"+location+"','"+password+"','"+(new Date().getTime()+"")+"');");
			System.out.println("insert data success!!");
			stmt.close();
			conn.close();
			
			
		}catch (Exception e1) {
			e1.getStackTrace();
		}
	}
	
}
