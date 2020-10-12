/**
 * 
 */
package dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import model.User;

/**
 * @author CatHuyThanh
 *
 */
@Repository
public class DatabaseShopping {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public boolean checkLogin(User user) {
		String SQL = "select * from account where user_mail = ? and password = ?";
		List<User> result = jdbcTemplate.query(SQL, new Object[] { user.getEmail(), user.getPassword() },
				new UserMapper());
		if (result.size() > 0) {
			return true;
		}
		return false;
	}

}
