
package bean;
import java.sql.* ; 
public class DataBean {
   private Connection conn ; 
   private ResultSet rs ; 
   private String travelNum ;
   private String account ; 
   private String theme ; 
   private String pic ; 
   private String view ;
   private String viewNum ; 
   
   
   public DataBean()
   {
       
   }
   
   public DataBean(String travelNum,String account,String theme,String pic,String view,String viewNum)
   {
       this.travelNum=travelNum ; 
       this.account=account ; 
       this.theme=theme ; 
       this.pic=pic ; 
       this.view=view ;
       this.viewNum=viewNum ; 
   }
   
   
   
   public Connection setConnection()
   {
       try{
           Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver") ; 
           conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databasename=GiLa;user=sa;password=111") ; 
       }catch(Exception e)
       {
           e.printStackTrace();
       }
       
       return conn ; 
   }
    public ResultSet getQuery(String sql)
    {
        try{
            Statement stat=conn.createStatement() ; 
            rs=stat.executeQuery(sql) ;
          
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
            return rs ; 
    }
    public void setModify(String sql){
        try{
            Statement stat=conn.createStatement() ; 
            stat.executeUpdate(sql) ; 
        }catch(Exception e){
            e.printStackTrace();
        }
    }
 public String getTravelNum()
 {
     return travelNum ; 
 }
 public String getAccount()
 {
     return account ; 
 }
 public String getTheme(){
     return theme ; 
 }
 public String getPic(){
     return pic ; 
 }
 public String getView(){
     return view ; 
 }
    
 public String getViewNum(){
	 return viewNum ; 
 }

 
 
 
 
 
 
    
}
