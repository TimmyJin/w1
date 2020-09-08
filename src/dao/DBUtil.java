package dao;

import java.sql.*;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 8:33
 * @Version 1.0
 */
public class DBUtil {
    private final static String DBDRIVER  = "com.mysql.cj.jdbc.Driver" ;
    private final static String DBURL = "jdbc:mysql://timmyjin.top:3306/dalongweb?serverTimezone=UTC&userSSL=false" ;
    private final static String DBUSER = "root" ;
    private final static String DBPASSWORD = "root" ;
    public static Connection getConnection(){
        try{
            Class.forName(DBDRIVER);
            Connection conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);
            return conn;
        }catch(ClassNotFoundException e){
            System.out.println("Error:DBDriver not found.");
            System.out.println(e.getMessage());
        }catch (SQLException e){
            System.out.println("Error:Database not found.");
            System.out.println(e.getMessage());
        }
        return null;
    }
    public static void close(ResultSet rs, Statement st,Connection conn){
        try{
           if(rs!=null)
               rs.close();
           if(st!=null)
               st.close();
           if(conn!=null)
               conn.close();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public ResultSet executeQuery(String sql){
        Connection conn = DBUtil.getConnection();
        ResultSet rs = null;
        Statement st = null;
        try {
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            return rs;
        }catch (SQLException ex){
            System.out.println(ex.getMessage());
        }
        return null;
    }
    public int executeUpdate(int ID){
        int result = 0;
        String sql = "update oorder set enforce=1 where orderID'"+ID+"'";
        Statement stmt = null;
        Connection conn = DBUtil.getConnection();
        try {
            stmt = conn.createStatement();
            stmt.executeUpdate(sql);
            result = 1;
            return result;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(null,stmt,conn);
        }
        return result;
    }
}
