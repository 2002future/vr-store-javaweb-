package domain;

import java.util.Date;

public class Goods {
    private int id;
    private String name;
    private String image;
    private float price;
    private String introduce;
    private Date date;
    //    存货
    private int stock;
    private int type_id;
   private  Type type;
   private  int sell;
   private  String scroll;//轮播图对象
    public Goods() {
    }

//  —————————————————————————————————————————————————————————————————————————————————— 实例化一个Type对象，多表连接的实现
public void setTypeid(int typeid) {
    if(type==null) {
        type = new Type();
    }
    type.setId(typeid);
}

    public void setTypename(String typename) {
        if(type==null) {
            type = new Type();
        }
        type.setName(typename);
    }
    public Type getType() {
        return type;
    }
    public void setType(Type type) {
        this.type = type;
    }
//——————————————————————————————————————————————————————————————————————————————


    public int getSell() {
        return sell;
    }

    public void setSell(int sell) {
        this.sell = sell;
    }

    public Goods(String name, String image, float price, String introduce, Date date, int stock, int type_id, Type type, int sell) {
        this.name = name;
        this.image = image;
        this.price = price;
        this.introduce = introduce;
        this.date = date;
        this.stock = stock;
        this.type_id = type_id;
        this.type = type;
        this.sell = sell;
    }

    public Goods(int id, String name, String image, float price, String introduce, Date date, int stock, int type_id, Type type, int sell) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.introduce = introduce;
        this.date = date;
        this.stock = stock;
        this.type_id = type_id;
        this.type = type;
        this.sell = sell;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getScroll() {
        return scroll;
    }

    public void setScroll(String scroll) {
        this.scroll = scroll;
    }




}
