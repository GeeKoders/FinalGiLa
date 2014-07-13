import java.sql.*;

public class MyDBDriver {
	Connection myConn;
	Statement myStmt;
	
	String dbType, dbAddr, dbPort, dbNameOrSID, dbUser, dbPwd;
	String dbDriver,dbURL;
	
	MyDBDriver (String _dbType, String _dbAddr, String _dbPort, String _dbNameOrSID, String _dbUser, String _dbPwd ) {
		dbType = _dbType;
		dbAddr = _dbAddr;
		dbPort = _dbPort;
		dbNameOrSID = _dbNameOrSID;
		dbUser = _dbUser;
		dbPwd = _dbPwd;
                if(dbType.toUpperCase()=="MSSQL")
                {
                    dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
			dbURL="jdbc:sqlserver://"+dbAddr+":"+dbPort+";databasename="+dbNameOrSID;
                }else if(dbType.toUpperCase()=="ORACLE")
                {
                    dbDriver="oracle.jdbc.driver.OracleDriver";
			dbURL="jdbc:oracle:thin:@"+dbAddr+":"+dbPort+":"+dbNameOrSID;
                }
                
		
	}
	
	public MyDBDriver () {
		dbType = "MSSQL";
		dbAddr = "localhost";
		dbPort = "1433";
		dbNameOrSID = "GiLa";
		dbUser = "sa";
		dbPwd = "111";
		
                if(dbType.toUpperCase()=="MSSQL")
                {
                    dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
			dbURL="jdbc:sqlserver://"+dbAddr+":"+dbPort+";databasename="+dbNameOrSID;
                }else if(dbType.toUpperCase()=="ORACLE")
                {
                    dbDriver="oracle.jdbc.driver.OracleDriver";
			dbURL="jdbc:oracle:thin:@"+dbAddr+":"+dbPort+":"+dbNameOrSID;
                }
                
		
	}

	public Connection getConnection(){
		try {
			Class.forName(dbDriver);
			if (dbUser.trim().equals("") && dbPwd.trim().equals(""))
				myConn = DriverManager.getConnection(dbURL+";integratedSecurity=true;");
			else
				myConn = DriverManager.getConnection(dbURL,dbUser,dbPwd); 
		}
		catch (Exception e) {
			System.out.println(e.getMessage());
			myConn = null;
		}
		return myConn;
	}	
}
