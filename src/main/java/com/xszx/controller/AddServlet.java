package com.xszx.controller;

import com.xszx.bean.Goods;
import com.xszx.dao.GoodsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/add")
public class AddServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 设置编码方式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        // 接收请求参数
        String name = req.getParameter("name");
        String seller = req.getParameter("seller");
        String status = req.getParameter("status");
        String category = req.getParameter("category");
        String priceStr = req.getParameter("price");
        int price = Integer.parseInt(priceStr);

        // 创建dao层对象，调用添加方法
        GoodsDao goodsDao = new GoodsDao();
        Goods goods = new Goods();
        goods.setName(name);
        goods.setSeller(seller);
        goods.setPrice(price);
        goods.setStatus(status);
        goods.setCategory(category);
        goodsDao.add(goods);

        // 重定向到列表展示的方法
        resp.sendRedirect(req.getContextPath() + "/findAll");
    }
}

