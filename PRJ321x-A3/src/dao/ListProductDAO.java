/**
 * 
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

/**
 * @author CatHuyThanh
 *
 */
public class ListProductDAO {

	// return the list of product by product name
	public List<Product> search(String characters) throws Exception {
		List<Product> listProduct = new ArrayList<>();
		DBContext db = new DBContext();
		Connection conn = db.getConnection();
		String sql = "select * from Products where LOWER(product_name) like'%" + characters.toLowerCase() + "%'";
		if("".equals(characters)) {
			sql = "select * from Products";
		}
		
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
				listProduct.add(p);
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listProduct;
	}

	// get the product
	public Product getProduct(String characters) throws Exception {
		DBContext db = new DBContext();
		Connection conn = db.getConnection();
		String sql = "select * from Products where product_id=" + characters;
		Product p = null;
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getString(5),
						rs.getString(6), rs.getString(7));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
}
