package dao.imp;

import dao.orderdao;
import vo.count;
import vo.order;

import java.util.List;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 10:09
 * @Version 1.0
 */
public class orderdaoimpl implements orderdao {

    @Override
    public boolean insert(order ord) {
        return false;
    }

    @Override
    public int getId(order ord) {
        return 0;
    }

    @Override
    public int insert1(order ord1) {
        return 0;
    }

    @Override
    public int getCount(count c, String sdate, String edate) {
        return 0;
    }

    @Override
    public List<count> getByCondition(count c, int fromIndex, int offset, String sdate, String edate) {
        return null;
    }

    @Override
    public int getSum(String sdate, String edate) {
        return 0;
    }
}
