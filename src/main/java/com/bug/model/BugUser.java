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
@Table(name="bug_user")
public class BugUser implements Serializable {
	
	public BugUser() {
	}

	public BugUser(Long id) {
		this.id = id;
	}
	@Id
	@GeneratedValue(generator = "sequence")
	@GenericGenerator(name = "sequence", strategy = "sequence", parameters={@Parameter(name="sequence",value="bug_user_sequence")})
	private Long id;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ref_country_id",referencedColumnName="id")
	private RefCountry refCountryId;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="middle_name")
	private String middleName;
	
	@Column(name="last_name")
	private String lastName;
	
	@Column(name="email")
	private String email;
	
	@Column(name="taluka")
	private String taluka;
	
	@Column(name="address")
	private String address;
	
	/*@JoinColumn(name="ref_state_id",referencedColumnName="id")
	private RefState refStateId;*/
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ref_district_id",referencedColumnName="id")
	private RefDistrict refDistrictId;
	
	
	@Column(name="pincode")
	private Long pincode;
	
	@Column(name="mobile")
	private Long mobile;
	
	@Column(name="phone_number")
	private String phoneNumber;
	
	@Column(name="fax")
	private String fax;
	
	@Column(name="user_name")
	private String userName;
	
	@Column(name="user_password")
	private String userPassword;
	
	@Column(name="status")
	private String status;
	
	@Column(name="is_deleted")
	private Boolean isDeleted;
	
	@Column(name="updated_by")
	private Long updatedBy;

	@Column(name="updated_on")
	private Date updatedOn;
	
	@OneToOne
	@JoinColumn(name="ref_user_role_id",referencedColumnName="id")
	private RefUserRole refUserRoleId;

	@Column(name="last_login_date")
	private Date lastLoginDate;

	@Column(name="session_id")
	private String sessionId;

	public String getTaluka() {
		return taluka;
	}

	public void setTaluka(String taluka) {
		this.taluka = taluka;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Boolean getIsDeleted() {
		return isDeleted;
	}

	public void setIsDeleted(Boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	public RefCountry getRefCountryId() {
		return refCountryId;
	}

	public void setRefCountryId(RefCountry refCountryId) {
		this.refCountryId = refCountryId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	/*public RefState getRefStateId() {
		return refStateId;
	}

	public void setRefStateId(RefState refStateId) {
		this.refStateId = refStateId;
	}*/

	public RefDistrict getRefDistrictId() {
		return refDistrictId;
	}

	public void setRefDistrictId(RefDistrict refDistrictId) {
		this.refDistrictId = refDistrictId;
	}

	public Long getPincode() {
		return pincode;
	}

	public void setPincode(Long pincode) {
		this.pincode = pincode;
	}

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	public Long getUpdatedBy() {
		return updatedBy;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public RefUserRole getRefUserRoleId() {
		return refUserRoleId;
	}

	public void setRefUserRoleId(RefUserRole refUserRoleId) {
		this.refUserRoleId = refUserRoleId;
	}

	public Date getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(Date lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	

	
}
