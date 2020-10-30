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


@WebServlet("/type")
public class TodoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TodoTypeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		TodoDao dao = new TodoDao();
		
		Long id = Long.parseLong(request.getParameter("id"));
		String type = request.getParameter("type");
		int sequence = Integer.parseInt(request.getParameter("sequence"));
		
		if (type.equals("DOING")) {
			type = "DONE";
			sequence = 2;
		} else if (type.equals("DONE"))
			type = "DOING";
		
		TodoDto dto = new TodoDto();
		
		dto.setId(id);
		dto.setType(type);
		dto.setSequence(sequence);
		
		dao.updateTodo(dto);
		
		PrintWriter out = response.getWriter();
		out.print("success");
		out.close();

		
		
	}

}
