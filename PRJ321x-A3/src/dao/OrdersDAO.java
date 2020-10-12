/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.Product;

/**
 * @author CatHuyThanh
 *
 */
public class OrdersDAO {

	// insert information of Order to data source, that including list of
	// products in cart (c) and information of buyer in Orders o
	public int insertOrder(Orders o, Cart c) throws Exception {
		DBContext db = new DBContext();
		Connection conn = db.getConnection();
		PreparedStatement ps;
		String sql = "";
		int status = 0;

		// insert data into table orders
		try {
			sql = "insert into Orders(user_mail, order_status, order_date, order_discount_code, order_address) values ("
					+ "?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, o.getUserMail());
			ps.setInt(2, 2);
			ps.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
			ps.setString(4, o.getDiscount());
			ps.setString(5, o.getAddress());

			status = ps.executeUpdate();

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		status = 0;
		conn = db.getConnection();

		sql = "select count (*) from Orders";
		Statement stmt = conn.createStatement();
		// Executing the query
		ResultSet rs = stmt.executeQuery(sql);
		// Retrieving the result
		rs.next();
		int count = rs.getInt(1);
		o.setOrderId(count);

		// insert data into table orders_detail
		try {
			for (int i = 0; i < c.getItems().size(); i++) {
				Product p = c.getItems().get(i);

				sql = "insert into Orders_detail(order_id, product_id, amount_product, price_product) values ("
						+ "?,?,?,?)";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, o.getOrderId());
				ps.setInt(2, p.getId());
				ps.setInt(3, p.getNumber());
				ps.setFloat(4, p.getPrice());

				status = ps.executeUpdate();
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
}
