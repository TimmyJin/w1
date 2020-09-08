package dao.imp;

import dao.DBUtil;
import dao.furdao;
import vo.furniture;

import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 10:09
 * @Version 1.0
 */
public class furdaoimpl implements furdao {
    @Override
    public furniture getId(int ID) {
        String sql = "select * from furniture where fid='" + ID + "'";
        Connection conn = null;
        ResultSet rs = null;
        furniture f = null;
        try {
            conn = DBUtil.getConnection();
            rs = conn.createStatement().executeQuery(sql);
            if (rs.next()) {
                f = new furniture();
                f.setFid(rs.getInt(1));
                f.setFname(rs.getString(2));
                f.setFsummary(rs.getString(3));
                f.setFnum(rs.getInt(4));
                f.setFmoney(rs.getInt(5));
                f.setFpic(rs.getString(6));
            }
            return f;
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(rs,null,conn);
        }
        return null;
    }
    @Override
    public void update(furniture f) {
        Connection conn=DBUtil . getConnection();
        String sql="update furniture set fname=?, fsummary=?, fnum=?, fmoney=? where fid=?";
        PreparedStatement pst=null;
        try {
            sql = new String(sql.getBytes("IS08859-1"), "GB2312");
            pst=conn. prepareStatement(sql);
            pst. setString(1, f.getFname());
            pst. setString(2, f.getFsummary());
            pst.setInt(3,f.getFnum());
            pst.setInt(4, f. getFmoney());
            pst. setInt(5, f.getFid());
            pst . executeUpdate();
        } catch (SQLException e) {
            e. printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e. printStackTrace();
        }finally{
            DBUtil. close(null, null, conn);
        }
    }
    @Override
    public boolean delete(String ID) {
        String sql="delete from furniture where fid='"+ID+"'";
        Connection conn = null;
        try{
            conn=DBUtil.getConnection();
            conn.createStatement().execute(sql);
            return true;
        }catch(SQLException e) {
            e. printStackTrace();
        }finally{
            DBUtil. close(null, null, conn);
        }
        return false;
    }

    @Override
    public boolean insert(furniture fur) {
        String sql="insert into furniture(fname,fsummary,fnum,fmoney,fpic) values(?,?;1,?,?)";
        Connection conn=null;
        try{
            conn=DBUtil.getConnection();
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,fur.getFname());
            ps.setString(2,fur.getFsummary());
            ps.setInt(3, fur.getFmoney());
            ps.setString(4,fur.getFpic());
            ps.executeUpdate( );
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }finally {
            DBUtil.close(null, null, conn);
            return false;
        }
    }

    @Override
    public int getCount(furniture b) {
        String sql = "select * from furniture where fname like '%"+b.getFname()+"%'";
        return getCount(sql);
        }

    @Override
    public int getCount(String sql) {
        String newSql = "select count(*)"+sql.substring(sql.indexOf("from"));
        Connection conn=DBUtil.getConnection();
        Statement st=null;
        ResultSet rs=null;
        try {
            st = conn.createStatement();
            rs = st.executeQuery(newSql);
            int count = 0;
            if (rs.next()) {
                count = rs.getInt(1);
            }
            return count;
        }catch(SQLException e) {
                e.printStackTrace();
            }finally{
                DBUtil.close(rs, st, conn);
            }
            return 0;
    }

    @Override
    public List<furniture> getByCondition(furniture b, int fromIndex, int offset) {
        String sql = "Select * from furniture where ";
        if(!(b.getFname()==null||"".equals(b.getFname())))
            sql += "fname like '%"+b.getFname()+"%'";
        boolean f = sql.toString().equals("select * form furniture where ");
        if(f){
            sql = "select * form furniture where ";
        }
        return getByCondition(sql,fromIndex,offset);
    }

    @Override
    public List<furniture> getByCondition(String sql, int fromIndex, int offset) {
        String newSql = sql+" limit "+fromIndex+" ,"+offset;
        Connection conn=DBUtil. getConnection();
        Statement st=null;
        ResultSet rs=null ;
        try {
            st=conn.createStatement();
            rs=st.executeQuery (newSql);
            List<furniture> flist=new ArrayList<furniture>();
            while(rs.next()){
                furniture b=new furniture();
                b.setFid(rs.getInt(1));
                b.setFname(rs.getString(2));
                b.setFsummary(rs.getString(3));
                b.setFnum(rs.getInt(4));
                b.setFmoney(rs.getInt(5));
                b.setFpic(rs.getString(6));
                flist.add(b);
            }
            return flist;
        } catch (SQLException e) {
            e. printStackTrace();
        }finally {
            DBUtil.close(rs,st,conn);
        }
        return null;
    }

    @Override
    public int update(int ID, int num) {
        int result=0;
        String sql="update furniture set fnum=fnum-'"+num+"' where fid='"+ID+"'";
        Connection conn=null;
        ResultSet rs=null;
        try{
            conn=DBUtil. getConnection();
            PreparedStatement ps=conn.prepareStatement(sql);
            result=ps. executeUpdate();
        }catch(SQLException e){
            e. printStackTrace();
        }finally{
            DBUtil.close(null, null, conn);
        }
        return result;
    }
}
