package com.xszx.controller;

import com.xszx.bean.Goods;
import com.xszx.dao.GoodsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/findAll")
public class FindAllServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 设置编码方式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        // 获取请求参数
        String name = req.getParameter("name");

        // 创建dao层的对象，调用dao层的方法
        GoodsDao goodsDao = new GoodsDao();
        List<Goods> list = goodsDao.findAll(name);

        // 将查询到的结果放入request对象中
        req.setAttribute("list", list);

        // 将请求转发到goods.jsp页面
        req.getRequestDispatcher("admin/goods.jsp").forward(req, resp);
    }
}


