package JDBC;

import java.sql.*;
public class JDBC {
  public static void main(String args[]) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");     //����MYSQL JDBC��������   
      //Class.forName("org.gjt.mm.mysql.Driver");
     System.out.println("Success loading Mysql Driver!");
    }
    catch (Exception e) {
      System.out.print("Error loading Mysql Driver!");
      e.printStackTrace();
    }
    
    
    try {
      Connection connect = DriverManager.getConnection(
    		  "jdbc:mysql://localhost:3306/guestbook?serverTimezone=CTT&useUnicode=true&characterEncoding=utf-8&useSSL=false","root","20040414");
           //����URLΪ   jdbc:mysql//��������ַ/���ݿ���  �������2�������ֱ��ǵ�½�û���������
      
      System.out.println("Success connect Mysql server!");
      Statement stmt = connect.createStatement();
      ResultSet rs = stmt.executeQuery("select * from user");

                                                              //user Ϊ��������
      while (rs.next()) {
    	  System.out.print(rs.getString(1));
    	  System.out.print(rs.getString(2));
    	  System.out.println(rs.getString(3));
      }
    }
    catch (Exception e) {
      System.out.print("get data error!");
      e.printStackTrace();
    }
  }
}
