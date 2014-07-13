
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ModelLogin {

    private String email;
    private String name;
    private String password;
    private String sex;
    private String location;
    public String getLocation() {
		return location;
	}
	public String getSex() {
		return sex;
	}

	MyDBDriver myDBDriver;
    Connection conn;
    Statement stmt;
    public ResultSet rs;
    public boolean result;
    List<String> errors = new ArrayList<String>();
    public ModelLogin(){
    	 try {

    		 myDBDriver = new MyDBDriver();
    		 conn = myDBDriver.getConnection();
    		 stmt = conn.createStatement();
    		 stmt=conn.createStatement();
    		 rs=stmt.executeQuery("select 會員帳號,會員暱稱,性別,居住縣市 from 會員檔"); 
    		 email=rs.getString("會員帳號");
    		 name=rs.getString("會員暱稱");
    		 sex=rs.getString("性別");
    		 location=rs.getString("居住縣市");
    		 
    		 
    	 }catch(Exception e){
    		 e.getStackTrace();
    	 }
    }
    public ModelLogin(String email, String password) {
    	 try {
    		 System.out.println(email+" "+password+" test");
             myDBDriver = new MyDBDriver();
             conn = myDBDriver.getConnection();
             stmt = conn.createStatement();
//          String sql = "select * from member Where email='"+email+"'";
//          rs=stmt.executeQuery(sql) ;
            stmt=conn.createStatement();
 		   rs=stmt.executeQuery("select 會員帳號,會員暱稱,性別,居住縣市,密碼 from 會員檔 where 會員帳號='"+email+"'"); 
		  
		   while(rs.next()) 
		   {
			  System.out.println("測試 "+rs.getString("會員帳號")+" "+rs.getString("密碼"));
			  if(!email.equals(rs.getString("會員帳號"))){
				   System.out.println("信箱未註冊");
				   errors.add("使用者信箱未註冊");
				  
			  }
        	  if(rs.getString("會員帳號").equals(email) && rs.getString("密碼").equals(password)){
        		
        		 this.email=email;
        		 this.name=rs.getString("會員暱稱");
        		 this.password=password;
        		 this.sex=rs.getString("性別");
        		 this.location=rs.getString("居住縣市");
        		 System.out.println("密碼正確");
        		 result=true ;
        		 break;
        	  }else {
        		 errors.add("密碼不正確");
        		 System.out.println("密碼不正確");
        		 result=false ;
        		 break;
        	  }
          }
		   
		
		 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<String> getLoginErrors(){
    	return errors;
    }
    
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
//	public static class test{ 
//		public static void main(String[]args){
//			ModelLogin mo = new ModelLogin("admin","22","111");
//			
//		}
//	}
}
