package kr.ac.ks.todolist.test;

import kr.ac.ks.todolist.dao.TodoDao;
import kr.ac.ks.todolist.dto.TodoDto;

public class TestClass {
	public static void main(String[] args) {
		TodoDao dao = new TodoDao();
		
		Long id = (long) 4;
		String type = "DONE";
		
		TodoDto todoDto = new TodoDto(id, null, 2, type);
		
		int updateCount = dao.updateTodo(todoDto);
		
		System.out.println(updateCount);
		
	}
}
