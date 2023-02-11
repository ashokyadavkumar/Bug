package com.bug.dao;

import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.BugUserLoginHistory;

public interface LoginDao {

	User loadUserByUsername(String username);

	void saveUserHistory(BugUserLoginHistory bugUserLoginHistory);

	Boolean updateUserLoginHistory(Long bugUser);

	BugUserLoginHistory updateUserLoginHistory(String ipAddress, User authUser);

	BugUser getBugUser(Long userid);

	void saveBugUser(BugUser lmUser);

}
