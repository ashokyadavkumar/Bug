package com.bug.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bug.dao.LoginDao;
import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.BugUserLoginHistory;
import com.bug.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginDao loginDao;
	
	

	@Override
	public User loadUserByUsername(String username) {
		return loginDao.loadUserByUsername(username);
	}

	@Override
	public void saveUserHistory(BugUserLoginHistory bugUserLoginHistory) {
		loginDao.saveUserHistory(bugUserLoginHistory);
	}

	@Override
	public BugUserLoginHistory updateUserLoginHistory(String ipAddress, User authUser) {
		return loginDao.updateUserLoginHistory(ipAddress,authUser);
	}

	@Override
	public BugUser getBugUser(Long userid) {
		return loginDao.getBugUser(userid);
	}

	@Override
	public void saveBugUser(BugUser bugUser) {
		loginDao.saveBugUser(bugUser);
	}


	@Override
	public Boolean updateUserLoginHistory(Long bugUser) {
		return loginDao.updateUserLoginHistory(bugUser);
		
	}

}
