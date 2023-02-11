package com.bug.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="bug_user_login_history")
public class BugUserLoginHistory {
	@Id
	@GeneratedValue(generator = "sequence")
	@GenericGenerator(name = "sequence", strategy = "sequence", parameters={@Parameter(name="sequence",value="bug_user_login_history_sequence")})
	private Long id;
	
	@OneToOne
	@JoinColumn(name="bug_user_id",referencedColumnName="id")
	private BugUser bugUserId;
	
	@Column(name="ip_address")
	private String ipAddress;
	
	@Column(name="login_date")
	private Date loginDate;

	
	@Column(name="session_details")
	private String sessionDetails;
	
	@Column(name="url")
	private String url;

	@Column(name="user_agent")
	private String userAgent;

	@Column(name="referrer")
	private String referrer;
	
	@Column(name="login_status")
	private String loginStatus;
	
	@Column(name="updated_on")
	private Date updatedOn;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BugUser getLmUserId() {
		return bugUserId;
	}

	public void setLmUserId(BugUser bugUserId) {
		this.bugUserId = bugUserId;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	public String getSessionDetails() {
		return sessionDetails;
	}

	public void setSessionDetails(String sessionDetails) {
		this.sessionDetails = sessionDetails;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getReferrer() {
		return referrer;
	}

	public void setReferrer(String referrer) {
		this.referrer = referrer;
	}

	public String getLoginStatus() {
		return loginStatus;
	}

	public void setLoginStatus(String loginStatus) {
		this.loginStatus = loginStatus;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

}
