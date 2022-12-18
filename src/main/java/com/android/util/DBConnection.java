package com.android.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	private static String jdbcURL="jdbc:mysql://localhost:3306/phonebookdata";
	private static String jdbcUsername="root";
	private static String jdbcPass="";
	static Connection connection=null;
	
	private static Connection OpenConnection()
	{
	    if(connection!=null)
	    {
	    	return connection;
	    }
	   
	    	try {
	    		Class.forName("com.mysql.jdbc.Driver");
	    		connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPass);
	    	}
	    	catch(Exception ex) {
				ex.printStackTrace();
			}
		
	   
	    return connection;
	}
	
   public static Connection getConnection()
   {
	   return OpenConnection();
   }
}
