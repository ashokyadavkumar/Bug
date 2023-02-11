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
@Table(name="ref_district")
public class RefDistrict implements Serializable {
	
	@Id
	@GeneratedValue(generator = "sequence")
	@GenericGenerator(name = "sequence", strategy = "sequence", parameters={@Parameter(name="sequence",value="ref_district_sequence")})
	private Long id;
	
	@Column(name="district_code")
	private String districtCode;
	
	@Column(name="district_name")
	private String districtName;
	
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="ref_state_id",referencedColumnName="id")
	private RefState refStateId;
	
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

	

	public String getDistrictCode() {
		return districtCode;
	}

	public void setDistrictCode(String districtCode) {
		this.districtCode = districtCode;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public RefState getRefStateId() {
		return refStateId;
	}

	public void setRefStateId(RefState refStateId) {
		this.refStateId = refStateId;
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
