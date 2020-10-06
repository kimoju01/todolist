package kr.ac.ks.todolist.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.ks.todolist.dao.TodoDao;
import kr.ac.ks.todolist.dto.TodoDto;


@WebServlet("/mainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/html;charset=utf-8");   
    	
        try {
        	TodoDao dao = new TodoDao();
            List<TodoDto> list = dao.getTodos();
          
            request.setAttribute("list", list);
            
            // MainServlet에서 생성한 정보를 main.jsp로 forwarding한다.
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/main.jsp"); 	
        	requestDispatcher.forward(request, response);
        } catch (Exception e) {
        	e.printStackTrace();
        }
    	
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
	
