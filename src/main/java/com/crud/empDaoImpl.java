package com.crud;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class empDaoImpl implements empDao {

	@Autowired
	private JdbcTemplate jt;

	public JdbcTemplate getJt() {
		return jt;
	}

	public void setJt(JdbcTemplate jt) {
		this.jt = jt;
	}

	@Override
	public void saveData(empEntity emp) {
		String sql = "insert into empForm (name,password,hobbies,gender,departments,position,empImg)values(?,?,?,?,?,?,?)";
		jt.update(sql, emp.getName(), emp.getPassword(), String.join(",", emp.getHobbies()), emp.getGender(),
				String.join(",", emp.getDepartments()), emp.getPosition(), emp.getEmpImg());
	}

	@Override
	public void updateData(empEntity emp) {

		String sql="update empForm set name=?,password=?,hobbies=?,gender=?,departments=?,position=?,empImg=? where id=?";
		jt.update(sql,emp.getName(),emp.getPassword(), String.join(",", emp.getHobbies()), emp.getGender(),
				String.join(",", emp.getDepartments()), emp.getPosition(), emp.getEmpImg(),emp.getId());
	}

	@Override
	public empEntity getEmpById(int id) {
		String sql="select *from empForm where id=?";
		return jt.queryForObject(sql,new empRowMapper(),id);
	}

	@Override
	public List<empEntity> getEmpAll() {
		String sql = "select *from empForm";
		return jt.query(sql, new empRowMapper());
		
	}

	@Override
	public void deleteEmp(int id) {
		String sql="delete from empForm where id=?";
		jt.update(sql,id);
	}

	private static class empRowMapper implements RowMapper<empEntity> {

		@Override
		public empEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
			empEntity emp = new empEntity();
			emp.setId(rs.getInt(1));
			emp.setName(rs.getString(2));
			emp.setPassword(rs.getString(3));
			emp.setHobbies(Arrays.asList(rs.getString(4).split(",")));
			emp.setGender(rs.getString(5));
			emp.setDepartments(Arrays.asList(rs.getString(6).split(",")));
			emp.setPosition(rs.getString(7));
			emp.setEmpImg(rs.getString(8));
			return emp;
		}
	}

	@Override
	public void saveUser(users user) {
		String sql = "insert into userssec (name,password,role)values(?,?,?)";
		jt.update(sql, user.getName(), user.getPassword(),user.getRole());
		
	}

	@Override
	public users getUser(String name, String password) {
	    String sql = "SELECT *FROM userssec WHERE name = ? AND password = ?";
	    try {
	        return jt.queryForObject(sql, new Object[]{name, password}, new RowMapper<users>() {
	            @Override
	            public users mapRow(ResultSet rs, int rowNum) throws SQLException {
	                users user = new users();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("name"));
	                user.setPassword(rs.getString("password"));
	                return user;
	            }
	        });
	    } catch (Exception e) {
	        e.printStackTrace(); 
	        return null;
	    }
	}


}
