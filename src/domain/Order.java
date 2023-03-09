package domain;

import utils.PriceUtils;

import java.util.*;

//订单实体
public class Order {
    private int id;
    private float total;//总价
    private int amount;// 商品总数
    private int status;//1未付款/2已付款/3已发货/4已完成
    private int paytype;//1微信/2支付宝/3货到付款
    private String name;
    private String phone;
    private String address;
    private Date datetime;
//    因为order实体涉及到了user_id,实例化一个User对象
    private User user;
//   ——————————————————————————******************************* 设置一个Map集合,Int包装类和订单项   订单项的集合（泛型）
//Integer 类在对象中包装了一个基本类型 int 的值。
    private Map<Integer,OrderItem> itemMap = new HashMap<Integer,OrderItem>();
    private List<OrderItem> itemList = new ArrayList<OrderItem>();
    public void setUsername(String username) {
        user = new User();
        user.setUsername(username);
    }
//    --------------------------------***************添加商品
    public void addGoods(Goods g) {
//        判断购物车中的订单是否包含此商品 map中的containsKey（key）方法是判断该key在map中是否有key存在。如果存在则返回true。如果不存在则返回false。
        if(itemMap.containsKey(g.getId())) {
//            如果存在,订单项 通过商品的id来在订单项集合中获取出来
            OrderItem item = itemMap.get(g.getId());
//            设置商品数量加1
            item.setAmount(item.getAmount()+1);
        }else {
//            否则实例化一个商品项对象
            OrderItem item = new OrderItem(g.getPrice(),1,g,this);
//            订单项集合里添加这个商品对象
            itemMap.put(g.getId(), item);
        }
        amount++;
//        计算总金额
        total = PriceUtils.add(total, g.getPrice());
//        System.out.println("_________________");
//        System.out.println(total);
    }
//————————————————————————————————————————*************************************
    public List<OrderItem> getItemList() {
        return itemList;
    }

    public void setItemList(List<OrderItem> itemList) {
        this.itemList = itemList;
    }
//减少商品的数量,同理
    public void lessen(int goodsid) {
        if(itemMap.containsKey(goodsid)) {
            OrderItem item = itemMap.get(goodsid);
            item.setAmount(item.getAmount()-1);
            amount--;
//            System.out.println(amount);
//            System.out.println("___________");
            total = PriceUtils.subtract(total, item.getPrice());
            System.out.println(total);
            if(item.getAmount()<=0) {
                itemMap.remove(goodsid);
            }
        }
    }
//    ——————————————————————————————————***************************
//    删除商品
    public void delete(int goodsid)
    {
        if(itemMap.containsKey(goodsid)) {
            OrderItem item = itemMap.get(goodsid);
            total = PriceUtils.subtract(total, item.getAmount()*item.getPrice());
            amount-=item.getAmount();
            itemMap.remove(goodsid);
        }
    }
//——————————————————————————*******************
    public Map<Integer, OrderItem> getItemMap() {
        return itemMap;
    }

    public void setItemMap(Map<Integer, OrderItem> itemMap) {
        this.itemMap = itemMap;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public float getTotal() {
        return total;
    }
    public void setTotal(float total) {
        this.total = total;
    }
    public int getAmount() {
        return amount;
    }
    public void setAmount(int amount) {
        this.amount = amount;
    }
    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public int getPaytype() {
        return paytype;
    }
    public void setPaytype(int paytype) {
        this.paytype = paytype;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public Date getDatetime() {
        return datetime;
    }
    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Order() {
        super();
    }
}
