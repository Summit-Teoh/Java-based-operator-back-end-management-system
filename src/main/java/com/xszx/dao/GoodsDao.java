package com.xszx.dao;

import com.xszx.bean.Goods;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// dao 中写操作数据库的代码
public class GoodsDao {

    // 根据名称查询商品信息
    public List<Goods> findAll(String name){
        Connection connection = null;
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.jdbc.Driver");

            // 获取数据库连接
            String url = "jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf-8";
            String user = "root";
            String password = "123456"; // 注意密码写成自己的
            connection = DriverManager.getConnection(url, user, password);

            String sql = "";
            // 编写查询的sql语句
            if(name != null && !name.equals("")){ // 用户输入了商品名称
                sql = "select * from goods where name like '%"+name+"%'";
            }else{ // 用户没有输入商品名称
                sql = "select * from goods";
            }

            // 创建预编译语句对象
            PreparedStatement ps = connection.prepareStatement(sql);

            // 执行sql语句
            ResultSet rs = ps.executeQuery();

            // 创建一个集合
            List<Goods> list = new ArrayList<>();

            // 遍历上面查询到的结果集，将其中的每条数据封装到goods对象中，然后将商品对象放入集合中
            while(rs.next()){
                Goods goods = new Goods();
                goods.setId(rs.getInt("id"));
                goods.setName(rs.getString("name"));
                goods.setSeller(rs.getString("seller"));
                goods.setStatus(rs.getString("status"));
                goods.setCategory(rs.getString("category"));
                goods.setPrice(rs.getInt("price"));
                goods.setCreatedate(rs.getDate("createdate"));
                list.add(goods);
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭连接释放资源
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return null;
    }

    public void add(Goods goods){
        Connection connection = null;
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 获取数据库连接
            String url = "jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf-8";
            String user = "root";
            String password = "123456"; // 注意密码写成自己的
            connection = DriverManager.getConnection(url, user, password);

            // 编写添加的sql语句
            String sql = "insert into goods values(null, ?, ?, ?, ?, ?, now())";
            // 创建预编译语句对象
            PreparedStatement ps = connection.prepareStatement(sql);

            // 给sql中占位符设置值
            ps.setString(1, goods.getName());
            ps.setString(2, goods.getSeller());
            ps.setString(3, goods.getStatus());
            ps.setString(4, goods.getCategory());
            ps.setInt(5, goods.getPrice());

            // 执行sql语句
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void update(Goods goods){
        Connection connection = null;
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 获取数据库连接
            String url = "jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf-8";
            String user = "root";
            String password = "123456"; // 注意密码写成自己的
            connection = DriverManager.getConnection(url, user, password);

            // 编写添加的sql语句
            String sql = "update goods set name=?, seller=?, status=?, category=?, price=? where id=?";
            // 创建预编译语句对象
            PreparedStatement ps = connection.prepareStatement(sql);

            // 给sql中占位符设置值
            ps.setString(1, goods.getName());
            ps.setString(2, goods.getSeller());
            ps.setString(3, goods.getStatus());
            ps.setString(4, goods.getCategory());
            ps.setInt(5, goods.getPrice());
            ps.setInt(6, goods.getId());

            // 执行sql语句
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void delete(int id){
        Connection connection = null;
        try {
            // 加载数据库驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 获取数据库连接
            String url = "jdbc:mysql://localhost:3306/shopping?useUnicode=true&characterEncoding=utf-8";
            String user = "root";
            String password = "123456"; // 注意密码写成自己的
            connection = DriverManager.getConnection(url, user, password);

            // 编写添加的sql语句
            String sql = "delete from goods where id=?";
            // 创建预编译语句对象
            PreparedStatement ps = connection.prepareStatement(sql);

            // 给sql中占位符设置值
            ps.setInt(1, id);

            // 执行sql语句
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(connection != null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

}

