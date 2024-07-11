package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoidao {
	public Connection cn;
	public void ketnoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		System.out.print("Da xac dinh dc he quan tri csdl");
		 String url = "jdbc:sqlserver://VANHOANG:1433;databaseName=QlBanPhim;user=sa;password=123;";
        cn = DriverManager.getConnection(url);
		System.out.print("Da ket noi");
	}
}
