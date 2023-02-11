package com.bug.service;

import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.BugUserLoginHistory;

public interface LoginService {

	User loadUserByUsername(String username);
	void saveUserHistory(BugUserLoginHistory lmsUserLoginHistory);
	Boolean updateUserLoginHistory(Long userid);
	BugUserLoginHistory updateUserLoginHistory(String ipAddress, User authUser);
	BugUser getBugUser(Long userid);
	void saveBugUser(BugUser bugUser);

}
