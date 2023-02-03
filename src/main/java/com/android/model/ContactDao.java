package com.android.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.android.entity.Contact;
import java.sql.Connection;

public class ContactDao {

	private Connection connection;

	public ContactDao(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean saveContact(Contact contact) {
		boolean add = false;
		try {
			String sql = "insert into contact(name,email,phoneNo,about,userId) values(?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, contact.getName());
			ps.setString(2, contact.getEmail());
			ps.setString(3, contact.getPhoneNo());
			ps.setString(4, contact.getAbout());
			ps.setInt(5, contact.getUserId());
			int i = ps.executeUpdate();
			if (i == 1) {
				add = true;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return add;
	}

	public List<Contact> getAllContacts(int uId) {
		List<Contact> list = new ArrayList<Contact>();
		Contact contact = null;
		try {
			String sql = "select * from contact where userId=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, uId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				contact = new Contact();
				contact.setId(rs.getInt(1));
				contact.setName(rs.getString(2));
				contact.setEmail(rs.getString(3));
				contact.setPhoneNo(rs.getString(4));
				contact.setAbout(rs.getString(5));
				list.add(contact);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Contact getContactById(int cid) {
		Contact contact = new Contact();
		try {
			PreparedStatement ps = connection.prepareStatement("select* from contact where id=?");
			ps.setInt(1, cid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				contact.setId(rs.getInt(1));
				contact.setName(rs.getString(2));
				contact.setEmail(rs.getString(3));
				contact.setPhoneNo(rs.getString(4));
				contact.setAbout(rs.getString(5));
				return contact;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return contact;
	}
	
	public boolean updateContact(Contact contact) {
		boolean update=false;
		try {
			String sql="update contact set name=?,email=?,phoneNo=?,about=? where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1,contact.getName());
			ps.setString(2,contact.getEmail());
			ps.setString(3,contact.getPhoneNo());
			ps.setString(4,contact.getAbout());
			ps.setInt(5, contact.getId());
			int i=ps.executeUpdate();
			if(i==1)
				update=true;
			return update;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return update;
	}
	
	public boolean deleteContactById(int cid) {
		boolean delete=false;
		try {
			String sql="delete from contact where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1,cid);
			int i=ps.executeUpdate();
			if(i==1)
				delete=true;
			return delete;
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return delete;
	}
}
