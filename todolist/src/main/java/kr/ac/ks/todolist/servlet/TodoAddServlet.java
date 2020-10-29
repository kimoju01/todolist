package kr.ac.ks.todolist.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.ks.todolist.dao.TodoDao;
import kr.ac.ks.todolist.dto.TodoDto;


@WebServlet("/add")
public class TodoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TodoAddServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		TodoDao dao = new TodoDao();
		
		String newtask = request.getParameter("newtask");
		
		TodoDto dto = new TodoDto();
		
		dto.setTitle(newtask);
		
		dao.addTodo(dto);
		
		response.sendRedirect("/todolist/mainServlet");
	}

}
