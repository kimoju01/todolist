package kr.ac.ks.todolist.dto;

public class TodoDto {

	
	private Long id;
	private String title;
	private Integer sequence;
	private String type;
	
	
	public TodoDto(Long id, String title, int sequence, String type) {
		super();
		this.id = id;
		this.title = title;
		this.sequence = sequence;
		this.type = type;
	}
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Integer getSequence() {
		return sequence;
	}
	
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}


	@Override
	public String toString() {
		return "TodoDto [id=" + id + ", title=" + title + ", sequence=" + sequence + ", type=" + type + "]";
	}
	
	
	
	
}
