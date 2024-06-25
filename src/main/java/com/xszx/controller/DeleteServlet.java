package com.xszx.controller;

import com.xszx.bean.Goods;
import com.xszx.dao.GoodsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 设置编码方式
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        // 接收请求参数
        String idStr = req.getParameter("id");
        int id = Integer.parseInt(idStr);

        // 创建dao层对象，调用添加方法
        GoodsDao goodsDao = new GoodsDao();
        goodsDao.delete(id);

        // 重定向到列表展示的方法
        resp.sendRedirect(req.getContextPath() + "/findAll");
    }
}

