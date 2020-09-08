package dao.imp;

import dao.DBUtil;
import dao.orderdao;
import vo.count;
import vo.order;
import vo.order_detail;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 10:09
 * @Version 1.0
 */
public class orderdaoimpl implements orderdao {

    @Override
    public boolean insert(order ord) {
        String sql="insert into oorder(bnumber,username,Truename,address,enforce,bz) values(?,?,?,?,0,?)";
        Connection conn=null ;
        try{
            conn=DBUtil.getConnection();
            PreparedStatement ps=conn.prepareStatement(sql);
            ps. setInt(1,ord.getBnumber());
            ps. setString(2,ord.getUsername());
            ps. setString(3,ord.getTruename());
            ps. setString(4,ord.getAddress());
            ps. setString(5,ord.getBz());
            ps. executeUpdate();
            return true;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            DBUtil.close(null,null, conn);
        }
        return false;
    }
    @Override
    public int getId(order ord) {
        String sql="select orderID from oorder where bnumber='"+ord.getBnumber()+"'"+"and Truename='"+ord.getTruename()+"'and address='"+ord.getAddress()+"'and bz='"+ord . getBz()+"'";
        PreparedStatement pst=null;
        int result=-1;
        ResultSet rs=null;
        Connection conn=DBUtil . getConnection();
        try {
            pst=conn. prepareStatement(sql);
            rs=pst. executeQuery();
            if(rs .next())
                result= rs. getInt("orderID");
            return result;
        } catch (SQLException e) {
            e. printStackTrace();
        }finally{
            DBUtil.close(rs, null, conn);
        }
        return result;
    }
    @Override
    public int insert1(order_detail ord1) {
        String sq1="insert into order_detail(orderID,goodsID,price,number) values('"+ord1.getOrderID()+"','"+ord1.getGoodsID()+"','"+ord1.getPrice( )+"','"+ord1.getNumber()+"')";
        int result=0;
        Connection conn=null;
        ResultSet rs=null;
        try{
            conn=DBUtil . getConnection();
            PreparedStatement ps=conn. prepareStatement(sq1);
            result=ps . executeUpdate();
        }catch(SQLException e){
            e. printStackTrace();
        }finally{
            DBUtil. close(null, null, conn);
        }
        return result;
    }

    @Override
    public int getCount(count c, String sdate, String edate) {
        String sql = "SELECT COUNT(DISTINCT fname) FROM count1 WHERE OrderDate>='"+sdate+"' AND OrderDate<='"+edate+"' ";
        Connection conn=DBUtil . getConnection();
        Statement st=null;
        ResultSet rs=null;
        try {
            st=conn.createStatement();
            rs=st.executeQuery(sql);
            int count1=0;
            if(rs.next()){
                count1 = rs.getInt(1);
                return count1;
            }
        }catch (SQLException e) {
            e. printStackTrace();
        }finally {
            DBUtil.close(rs, st, conn);
        }
        return 0;
    }

    @Override
    public List<count> getByCondition(count c, int fromIndex, int offset, String sdate, String edate) {
        String sql="SELECT fname,SUM(number) FROM count1 WHERE OrderDate>='"+sdate+"' "+ "AND OrderDate<='"+edate+"' GROUP BY fname";
        String newSql = sql+" limit "+fromIndex+" ,"+offset;
        Connection conn=DBUtil.getConnection();
        Statement st=null;
        ResultSet rs=null;
        try{
            st=conn.createStatement();
            rs=st. executeQuery(newSql);
            List<count> clist=new ArrayList<count>();
            while(rs.next()){
                count ct=new count( ) ;
                ct.setFname(rs.getString(1));
                ct.setNum(rs.getInt(2));
                clist.add(ct);
                return clist;
            }
        }catch (SQLException e) {
            e. printStackTrace();
        }finally{
            DBUtil.close(rs, st, conn);
        }
        return null;
        }

    @Override
    public int getSum(String sdate, String edate) {
        int result=0;
        String sql="SELECT SUM(number) FROM count1 WHERE OrderDate>='"+sdate+"' AND OrderDate<='"+edate+"' ";
        Connection conn=DBUtil.getConnection();
        Statement st=null ;
        ResultSet rs=null;
        try{
            st=conn.createStatement();
            rs=st.executeQuery(sql);
            if(rs.next()){
                result = rs.getInt(1);
            }
            return result;
        }catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBUtil.close(rs, st, conn);
            return result;
        }
    }
}
