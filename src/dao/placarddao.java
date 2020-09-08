package dao;

import vo.placard;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 8:34
 * @Version 1.0
 */
public interface placarddao {
    public void insert(placard plac);
    public placard query(int ID);
    public int delete(String bbsID);
}
