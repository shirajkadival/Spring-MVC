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
		String sql = "insert into empForm (name,city,hobbies,gender,departments,position,empImg)values(?,?,?,?,?,?,?)";
		jt.update(sql, emp.getName(), emp.getCity(), String.join(",", emp.getHobbies()), emp.getGender(),
				String.join(",", emp.getDepartments()), emp.getPosition(), emp.getEmpImg());
	}

	@Override
	public void updateData(empEntity emp) {

		String sql="update empForm set name=?,city=?,hobbies=?,gender=?,departments=?,position=?,empImg=? where id=?";
		jt.update(sql,emp.getName(),emp.getCity(), String.join(",", emp.getHobbies()), emp.getGender(),
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
			emp.setCity(rs.getString(3));
			emp.setHobbies(Arrays.asList(rs.getString(4).split(",")));
			emp.setGender(rs.getString(5));
			emp.setDepartments(Arrays.asList(rs.getString(6).split(",")));
			emp.setPosition(rs.getString(7));
			emp.setEmpImg(rs.getString(8));
			return emp;
		}
	}

}
