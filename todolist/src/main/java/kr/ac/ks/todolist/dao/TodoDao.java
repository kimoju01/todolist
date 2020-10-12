package kr.ac.ks.todolist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.ks.todolist.dto.TodoDto;

public class TodoDao {
	
	private static String dburl = "jdbc:mysql://localhost:3306/todoapp?useUnicode=true&characterEncoding=utf8";
	private static String dbuser = "kim";
	private static String dbpasswd = "kimpw";
	
	public TodoDto getTodo(Integer todoId) {
		// 기본 키 todoId에 해당하는 한 건의 정보를 가져오는 메서드
		// 한 건 가져왔을 때 한 건에 대한 정보를 담아 올 객체 = TodoDto
		
		TodoDto todoDto = null;
		Connection conn = null;			
		PreparedStatement ps = null;	
		ResultSet rs = null;			

		try {
			Class.forName("com.mysql.jdbc.Driver");		
			conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
			String sql = "SELECT id, title, sequence, type FROM todo WHERE id = ?";
			ps = conn.prepareStatement(sql);	
			ps.setInt(1, todoId);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				Long id = rs.getLong("id");
				String title = rs.getString("title");
				int sequence = rs.getInt("sequence");
				String type = rs.getString("type");
				
				todoDto = new TodoDto(id, title, sequence, type);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	//if
			if(ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	//if
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}	//if
		}	//finally
		
		return todoDto;
	}
	
	
	public int addTodo(TodoDto todoDto) {
		int insertCount = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
			
			String sql = "INSERT INTO todo (title) VALUES (?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, todoDto.getTitle());
	
			insertCount = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (Exception e) {}
			}	//if
			
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {}
			}	//if
		}	//finally
		
		return insertCount;
	}
	
	public int deleteTodo(Integer todoId) {
		int deleteCount = 0;
		
		Connection conn = null;			
		PreparedStatement ps = null;	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
			
			String sql = "DELETE FROM todo WHERE id = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, todoId);
			
			deleteCount = ps.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (Exception ex) {}
			} //if
			
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception ex) {}
			} //if
		} //finally

		
		return deleteCount;
	}
	
	
	public int updateTodo(TodoDto todoDto) {
		int updateCount = 0;
		
		Connection conn = null;			
		PreparedStatement ps = null;	
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
			
			String sql = "UPDATE todo SET sequence = ?, type = ? WHERE id = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, todoDto.getSequence());
			ps.setString(2, todoDto.getType());
			ps.setLong(3, todoDto.getId());
			
			updateCount = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ps != null) {
				try {
					ps.close();
				} catch (Exception e) {}
			} //if
			
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {}
			} //if
		} //finally
		
		return updateCount;
	}
		
	
	public List<TodoDto> getTodos() {
		List<TodoDto> list = new ArrayList<>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String sql = "SELECT id, title, sequence, type FROM todo order by sequence desc";
		try (Connection conn = DriverManager.getConnection(dburl, dbuser, dbpasswd);
				PreparedStatement ps = conn.prepareStatement(sql)) {
				//알아서 close 하는 문법. => finally 구문이 필요 X
				
				try (ResultSet rs = ps.executeQuery()) {
					
					while (rs.next()) {	
						Long id = rs.getLong("id");
						String title = rs.getString("title");
						int sequence = rs.getInt("sequence");
						String type = rs.getString("type");

						TodoDto todoDto = new TodoDto(id, title, sequence, type);
						
						list.add(todoDto);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
