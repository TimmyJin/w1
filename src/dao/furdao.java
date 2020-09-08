package dao;

import vo.furniture;

import java.util.List;

/**
 * @Author TimmyJin
 * @Date 2020/9/8 8:33
 * @Version 1.0
 */
public interface furdao {
        public furniture getId(int ID);
        public void update (furniture f);
        public boolean delete(String ID);
        public boolean insert(furniture fur);
        public int getCount(furniture b);
        public int getCount(String sql);
        public List<furniture> getByCondition(furniture b,int fromIndex,int offset);
        public List<furniture> getByCondition(String sql,int fromIndex,int offset);
        public int update(int ID,int num);
}
