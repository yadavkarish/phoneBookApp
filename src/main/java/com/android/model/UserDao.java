package com.android.model;

import com.android.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	
	private Connection connection;

	public UserDao(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean userRegister(User user) {
		boolean register=false;
		try {
			String sql="insert into user(name,email,password) values(?,?,?)";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			int i=ps.executeUpdate();
			if(i==1)
			{
				register=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return register;
	}
	
	public User loginUser(String email,String password) {
		User user=null;
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=connection.prepareStatement(sql);
	        ps.setString(1,email);
			ps.setString(2,password);
		    ResultSet rs=ps.executeQuery();
		    while(rs.next())
		    {
		    	user=new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
		    }
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return user;
	}
	

}
