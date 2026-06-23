package servlet;
import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

@Annotation(id=1, name="Toky")
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
          String AnnotationContenue="Annotation id:"+this.getClass().getAnnotation(Annotation.class).id()+", name:"+this.getClass().getAnnotation(Annotation.class).name();
          req.setAttribute("url", url);
          req.setAttribute("annotation", AnnotationContenue);
          System.out.println("AnnotationContenue:"+AnnotationContenue);
          dispat.forward(req, res);
    }
}
