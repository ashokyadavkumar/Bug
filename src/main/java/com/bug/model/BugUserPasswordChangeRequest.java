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
@Table(name="bug_user_password_change_request")
public class BugUserPasswordChangeRequest implements Serializable {
	
	public BugUserPasswordChangeRequest() {
	}

	public BugUserPasswordChangeRequest(Long id) {
		this.id = id;
	}
	@Id
	@GeneratedValue(generator = "sequence")
	@GenericGenerator(name = "sequence", strategy = "sequence", parameters={@Parameter(name="sequence",value="bug_user_password_change_request_sequence")})
	private Long id;
	
	@OneToOne//(fetch=FetchType.LAZY)
	@JoinColumn(name="bug_user_id",referencedColumnName="id")
	private BugUser bugUser;
	
	@Column(name="enc_type")
	private String encType;
	
	@Column(name="requested_on")
	private Date requestedOn;
	
	@Column(name="is_deleted")
	private Boolean isDeleted;
	
	@Column(name="updated_by")
	private Long updatedBy;

	@Column(name="updated_on")
	private Date updatedOn;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BugUser getLmUser() {
		return bugUser;
	}

	public void setLmUser(BugUser bugUser) {
		this.bugUser = bugUser;
	}

	public String getEncType() {
		return encType;
	}

	public void setEncType(String encType) {
		this.encType = encType;
	}

	public Date getRequestedOn() {
		return requestedOn;
	}

	public void setRequestedOn(Date requestedOn) {
		this.requestedOn = requestedOn;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public Long getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Long updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	
	
}
