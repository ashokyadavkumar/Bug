/**
 * 
 */
package com.bug.dao;
import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Service;

import com.bug.bean.CommanBean;
import com.bug.bean.IssueBean;
import com.bug.model.BugUser;
import com.bug.model.BugUserPasswordChangeRequest;
import com.bug.model.Issue;
import com.bug.model.Module;
import com.bug.model.Project;
import com.bug.model.RefUserRole;


@Service
public interface MasterDao {
	
	
	public Session getSession();

	public BugUser getLoggedUser(Long userId);

	public BugUser getUserByLoginName(String userName);
	public <T> T savePojo(T t) throws Exception;
	public BugUserPasswordChangeRequest getPasswordChangeRequest(String enctype);

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

	public List<Module> getAllModule();

	public List<BugUser> getRoleByUser();

	public Long assignModule(CommanBean commanBean);

	public IssueBean getModuleById(IssueBean issueBean);

	public Long saveBug(IssueBean issueBean);

	public List<Issue> getAllIssue();

	public List<Issue> getAllIssueCondition(IssueBean issueBean);

	public Long updateBug(IssueBean issueBean);
	
}
