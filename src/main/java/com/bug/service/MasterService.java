package com.bug.service;

import java.util.List;

import com.bug.bean.CommanBean;
import com.bug.model.BugUser;
import com.bug.model.BugUserPasswordChangeRequest;
import com.bug.model.Module;
import com.bug.model.Project;
import com.bug.model.RefUserRole;




//@Servicec
public interface MasterService
{

	public BugUser getUserByLoginName(String userName);

	public <T> T savePojo(T t) throws Exception;

	public BugUserPasswordChangeRequest getPasswordChangeRequest(String enctype);

	public BugUser getLoggedUser(Long userId);

	public List<RefUserRole> getUserRoleList();

	public Long saveMemberPersonalDetails(CommanBean memberRegistration);

	public BugUser searchByEmail(CommanBean memberRegistration);

	public BugUser searchById(CommanBean memberRegistration);

	public List<BugUser> searchByDesignation(CommanBean memberRegistration);

	public Long updateuserDetails(CommanBean memberRegistration);

	public Long saveprojectDetails(CommanBean commanBean);

	public Project searchByProjectId(CommanBean commanBean);

	public Project updateProjectId(CommanBean commanBean);

	public List<Project> getProjectList();

	public Long addModule(CommanBean commanBean);

	public List<Module> searchBugByModuleId(CommanBean commanBean);




	
}



