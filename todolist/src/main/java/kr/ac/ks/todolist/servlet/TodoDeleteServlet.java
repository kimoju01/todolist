package kr.ac.ks.todolist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.ks.todolist.dao.TodoDao;
import kr.ac.ks.todolist.dto.TodoDto;

@WebServlet("/delete")
public class TodoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TodoDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		TodoDao dao = new TodoDao();
		TodoDto dto = new TodoDto();
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		dao.deleteTodo(id);
		
		PrintWriter out = response.getWriter();
		out.print("success");
		out.close();
		
	}

}
