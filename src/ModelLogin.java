
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
    		 rs=stmt.executeQuery("select �|���b��,�|���ʺ�,�ʧO,�~���� from �|����"); 
    		 email=rs.getString("�|���b��");
    		 name=rs.getString("�|���ʺ�");
    		 sex=rs.getString("�ʧO");
    		 location=rs.getString("�~����");
    		 
    		 
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
 		   rs=stmt.executeQuery("select �|���b��,�|���ʺ�,�ʧO,�~����,�K�X from �|���� where �|���b��='"+email+"'"); 
		  
		   while(rs.next()) 
		   {
			  System.out.println("���� "+rs.getString("�|���b��")+" "+rs.getString("�K�X"));
			  if(!email.equals(rs.getString("�|���b��"))){
				   System.out.println("�H�c�����U");
				   errors.add("�ϥΪ̫H�c�����U");
				  
			  }
        	  if(rs.getString("�|���b��").equals(email) && rs.getString("�K�X").equals(password)){
        		
        		 this.email=email;
        		 this.name=rs.getString("�|���ʺ�");
        		 this.password=password;
        		 this.sex=rs.getString("�ʧO");
        		 this.location=rs.getString("�~����");
        		 System.out.println("�K�X���T");
        		 result=true ;
        		 break;
        	  }else {
        		 errors.add("�K�X�����T");
        		 System.out.println("�K�X�����T");
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
