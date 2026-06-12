package servlet;
import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;


public class AinaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        handleRequest(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        handleRequest(req, res);
    }

     public void handleRequest(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
          System.out.println("FrontControllerServlet: forwarding to /Aina.jsp");
          RequestDispatcher dispat = req.getRequestDispatcher("/Aina.jsp");
          String url=req.getRequestURL().toString();
          req.setAttribute("url", url);
          dispat.forward(req, res);
    }
}
