package com.bug.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="assign")
public class Assign implements Serializable {
	
	public Assign() {
	}

	public Assign(Long id) {
		this.id = id;
	}
	@Id
	@GeneratedValue(generator = "sequence")
	@GenericGenerator(name = "sequence", strategy = "sequence", parameters={@Parameter(name="sequence",value="assign_sequence")})
	private Long id;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="project_id",referencedColumnName="id")
	private Project projectId;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="module_id",referencedColumnName="id")
	private Module moduleId;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id",referencedColumnName="id")
	private BugUser userId;
	
	@Column(name="status")
	private String status;
	
	@Column(name="is_deleted")
	private Boolean isDeleted;
	
	@Column(name="updated_on")
	private Date updatedOn;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Project getProjectId() {
		return projectId;
	}

	public void setProjectId(Project projectId) {
		this.projectId = projectId;
	}

	public Module getModuleId() {
		return moduleId;
	}

	public void setModuleId(Module moduleId) {
		this.moduleId = moduleId;
	}

	public BugUser getUserId() {
		return userId;
	}

	public void setUserId(BugUser userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}


	
}
