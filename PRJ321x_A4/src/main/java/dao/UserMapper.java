/**
 * 
 */
package dao;

import model.User;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

/**
 * @author CatHuyThanh
 *
 */
public class UserMapper implements RowMapper<User> {
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User u = new User();
		u.setEmail(rs.getString("user_mail"));
		u.setPassword(rs.getString("password"));
		u.setRole(rs.getInt("account_role"));
		u.setName(rs.getString("user_name"));
		u.setAddress(rs.getString("user_address"));
		u.setPhone(rs.getString("user_phone"));
		return u;
	}
}
