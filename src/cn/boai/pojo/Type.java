package cn.boai.pojo;

import java.io.Serializable;

public class Type implements Serializable{
	public Type() {
	}
	
	private Integer type_id;
	private String type_name;
	private String type_def;
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getType_def() {
		return type_def;
	}
	public void setType_def(String type_def) {
		this.type_def = type_def;
	}
	
	

}
