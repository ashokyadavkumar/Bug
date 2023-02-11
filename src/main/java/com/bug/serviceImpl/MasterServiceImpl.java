/**
 * 
 */
package com.bug.serviceImpl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bug.bean.CommanBean;
import com.bug.dao.MasterDao;
import com.bug.model.BugUser;
import com.bug.model.BugUserPasswordChangeRequest;
import com.bug.model.Project;
import com.bug.model.RefUserRole;
import com.bug.service.MasterService;




/**
 * @author
 */
@Service
@Transactional
public class MasterServiceImpl implements MasterService {
	
	@Autowired
	MasterDao masterDao;

	@Override
	public BugUser getUserByLoginName(String userName) {
		return masterDao.getUserByLoginName(userName);
	}

	@Override
	public <T> T savePojo(T t) throws Exception {
		return masterDao.savePojo(t);
	}

	@Override
	public BugUserPasswordChangeRequest getPasswordChangeRequest(String enctype) {
		return masterDao.getPasswordChangeRequest(enctype);
	}
   

	@Override
	public BugUser getLoggedUser(Long userId) {
		return masterDao.getLoggedUser(userId);
	}

	@Override
	public List<RefUserRole> getUserRoleList() {
		return masterDao.getUserRoleList();
	}

	@Override
	public Long saveMemberPersonalDetails(CommanBean memberRegistration) {
		return masterDao.saveMemberPersonalDetails(memberRegistration);
	}

	@Override
	public BugUser searchByEmail(CommanBean memberRegistration) {
		return masterDao.searchByEmail(memberRegistration);
	}

	@Override
	public BugUser searchById(CommanBean memberRegistration) {
		// TODO Auto-generated method stub
		return masterDao.searchById(memberRegistration);
	}

	@Override
	public List<BugUser> searchByDesignation(CommanBean memberRegistration) {
		// TODO Auto-generated method stub
		return masterDao.searchByDesignation(memberRegistration);
	}

	@Override
	public Long updateuserDetails(CommanBean memberRegistration) {
		// TODO Auto-generated method stub
		return masterDao.updateuserDetails(memberRegistration);
	}

	@Override
	public Long saveprojectDetails(CommanBean commanBean) {
		// TODO Auto-generated method stub
		return masterDao.saveprojectDetails(commanBean);
	}

	@Override
	public Project searchByProjectId(CommanBean commanBean) {
		// TODO Auto-generated method stub
		return masterDao.searchByProjectId(commanBean);
	}

	@Override
	public Project updateProjectId(CommanBean commanBean) {
		// TODO Auto-generated method stub
		return masterDao.updateProjectId(commanBean);
	}


	
	
}