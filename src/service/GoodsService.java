package service;

import dao.GoodsDao;
import domain.Goods;
import org.apache.commons.dbutils.QueryRunner;
import utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class GoodsService {
    private GoodsDao gDao=new GoodsDao();
    //     _______________________________________________________________________________________ 根据商品类型获取
    public   List<Map<String,Object>> getGoodsList(int recommendType) {
        List<Map<String,Object>> list=null;
        try {
            list=gDao.getGoodsList(recommendType);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //     _______________________________________________________________________________________ 获取全部商品
    public   List<Map<String,Object>> getAllGoods() {
        List<Map<String,Object>> list=null;
        try {
            list=gDao.getAllGoods();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //     _______________________________________________________________________________________ 获取全部搜索商品
    public   List<Map<String,Object>> getAllSearchGoods(String keyword) {
        List<Map<String,Object>> list=null;
        try {
            list=gDao.getAllSearchGoods(keyword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
//     _______________________________________________________________________________________    获取每个商品的详情
    public Goods getGoodsById(int id) {
        Goods g=null;
        try {
            g = gDao.getGoodsById(id);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return g;
    }
    //   _______________________________________________________________________________________ 获取新品
    public List<Goods> getNewsGoods() {
        List<Goods> g=null;
        try {
            g = gDao.getNewsGoods();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return g;
    }
    //   ______________________________________________________________ 根据时间获取全部新品，限制在40个，不然太多的话会加大服务器压力
    public List<Goods> getAllNewsGoods() {
        List<Goods> g=null;
        try {
            g = gDao.getAllNewsGoods();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return g;
    }
    //   _______________________________________________________________________________________ 获取热销产品
    public List<Goods> getSellGoods() {
        List<Goods> g=null;
        try {
            g = gDao.getSellGoods();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return g;
    }
    //   _______________________________________________________________________________________ 根据销售量获取全部产品
    public List<Goods> getAllSellGoods() {
        List<Goods> g=null;
        try {
            g = gDao.getAllSellGoods();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return g;
    }
    //   _______________________________________________________________________________________ 查询商品
    public List<Goods> getSearchGoods(String  keyWord) {
        List<Goods> g=null;
        try {
            g = gDao.getSearchGoods( keyWord);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return g;
    }

    //   _______________________________________________________________________________________ 获取轮播图对象
    public List<Goods> getScrollGood() {
        List<Goods> g=null;
        try {
            g = gDao.getScrollGood();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
       return  g;
    }
    //   _______________________________________________________________________________________ 添加商品
    public void insert(Goods g)  {

        try {
            gDao.insert(g);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//    _________________________________________修改商品
    public void update(Goods goods) {
        try {
            gDao.update(goods);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
//    _________________________________________删除商品
    public void delete(int id) {
        try {
            gDao.delete(id);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
