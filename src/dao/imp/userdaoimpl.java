package dao.imp;

import dao.DBUtil;
import dao.userdao;
import vo.consumer;
import vo.operator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 10:09
 * @Version 1.0
 */
public class userdaoimpl implements userdao {

    @Override
    public boolean isLogin(String cname, String password, int role) {
        String sq1;
        Connection conn= DBUtil.getConnection();
        if(role==0)
            sq1="select * from operator where oname=? and opassword=? and ostatus=?" ;
        else
            sq1="select * from consumer where cname=? and cpassword=? and ostatus=?";
        PreparedStatement pst=null ;
        ResultSet rs=null;
        try {
            pst=conn.prepareStatement(sq1);
            pst.setString(1, cname);
            pst.setString(2, password);
            pst.setInt(3, role);
            rs=pst.executeQuery();
            if(rs.next())
                return true ;
        }catch(SQLException e) {
            e. printStackTrace();
        }finally{
            DBUtil.close(rs, null, conn);
        }
        return false;


    }

    @Override
    public consumer getId(String cname, int role) {
        String sq1 = "select * from consumer where cname='" + cname + "'";
        Connection conn = null;
        ResultSet rs = null;
        consumer u = null;
        try {
            conn = DBUtil.getConnection();
            rs = conn.createStatement().executeQuery(sq1);
            if (rs.next()) {
                u = new consumer();
                u.setCid(rs.getInt(1));
                u.setCname(rs.getString(2));
                u.setCpassword(rs.getString(3));
                u.setCtel(rs.getString(4));
                u.setCmoney(rs.getInt(5));
                u.setOstatus(rs.getInt(6));
            }
            return u;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, null, conn);
        }
        return null;
    }

    @Override
    public operator getId1(String oname, int role) {
        String sql="select * from operator where oname='"+oname+"'";
        Connection conn=null;
        ResultSet rs=null;
        operator v=null;
        try{
            conn=DBUtil.getConnection();
            rs=conn.createStatement().executeQuery(sql);
            if(rs.next()){
                v=new operator();
                v.setOid(rs . getInt(1));
                v.setOpassword(rs . getString(2));
                v.setOname(rs. getString(3));
                v.setOstatus(rs. getInt(4));
            }
            return v;
        }catch(SQLException e){
            e. printStackTrace( );
        }finally{
            DBUtil. close(rs, null, conn);
        }
        return null;

    }

    @Override
    public boolean insert(consumer u) {
        String sq1 = "insert into consumer(cname,cpassword,ctel,cmoney,ostatus) values(?,?,?,10000,1)";
        Connection conn = null;
        try {
            conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sq1);
            ps.setString(1, u.getCname());
            ps.setString(2, u.getCpassword());
            ps.setString(3, u.getCtel());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, null, conn);
        }
        return false;
    }

    @Override
    public boolean delete(String cname) {
        String sq1="delete from consumer where cname='"+cname+"'";
        Connection conn=null ;
        try{
            conn=DBUtil.getConnection();
            conn.createStatement().execute(sq1);
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            DBUtil.close(null, null, conn);
        }
        return false;
    }
}
