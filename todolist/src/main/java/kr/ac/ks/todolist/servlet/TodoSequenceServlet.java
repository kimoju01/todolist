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

@WebServlet("/sequence")
public class TodoSequenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TodoSequenceServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		TodoDao dao = new TodoDao();
		
		Long id = Long.parseLong(request.getParameter("id"));
		int sequence = Integer.parseInt(request.getParameter("sequence"));
		
		if (sequence == 1)
			sequence = 2;
		else if (sequence == 2)
			sequence = 1;
		
		TodoDto dto = new TodoDto();
		
		dto.setId(id);
		dto.setSequence(sequence);
		dto.setType("DOING");
		
		dao.updateTodo(dto);
		
		PrintWriter out = response.getWriter();
		out.print("success");
		out.close();
		
	}

}
