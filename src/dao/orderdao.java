package dao;

import vo.count;
import vo.order;
import vo.order_detail;

import java.util.List;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 8:33
 * @Version 1.0
 */
public interface orderdao {
    public boolean insert(order ord);
    public int getId(order ord);
    public int insert1(order_detail ord1);
    public int getCount(count c, String sdate, String edate);
    public List<count> getByCondition(count c,int fromIndex,int offset,String sdate,String edate);
    public int getSum(String sdate,String edate);
}
