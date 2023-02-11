package com.bug.daoImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bug.dao.LoginDao;
import com.bug.loginbean.Role;
import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.BugUserLoginHistory;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User loadUserByUsername(String username) {
		Session session = null;
		User user = null;
		try{
			session = sessionFactory.openSession();
			BugUser bugUser =(BugUser)session.createCriteria(BugUser.class).add(Restrictions.eq("userName",username)).uniqueResult();
			if(bugUser!=null){
				user = new User();
				user.setUserid(bugUser.getId());
				user.setFirstName(bugUser.getFirstName());
				user.setMiddleName(bugUser.getMiddleName());
				user.setLastName(bugUser.getLastName());
				user.setUsername(bugUser.getUserName());
				user.setPassword(bugUser.getUserPassword());
				user.setRoleid(bugUser.getRefUserRoleId().getId());
				Role r = new Role();
				r.setName("ROLE_"+bugUser.getRefUserRoleId().getRoleName().toUpperCase());
				//r.setName("ROLE_ADMIN");
				List<Role> roles = new ArrayList<Role>();
				roles.add(r);
				user.setAuthorities(roles);
			}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		finally{if(session!=null)session.close();}
		return user;
	}

	@Override
	public void saveUserHistory(BugUserLoginHistory bugUserLoginHistory) {
		Session session = sessionFactory.openSession();
		try{
		Transaction tx = session.beginTransaction();
		bugUserLoginHistory.setUpdatedOn(new Date());
		session.saveOrUpdate(bugUserLoginHistory);
		tx.commit();
		session.flush();
		}
		catch(Exception e){e.printStackTrace();}
		finally{if(session!=null)session.close();}
	}


	@Override
	public BugUser getBugUser(Long userid) {
		Session session = null;
		BugUser bugUser = null;
		try{
			session = sessionFactory.openSession();
			bugUser =(BugUser)session.createCriteria(BugUser.class).add(Restrictions.eq("id",userid)).uniqueResult();
		}catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null)session.close();}
		return bugUser;
	}

	@Override
	public void saveBugUser(BugUser bugUser) {
		Session session = null;
		try{
			session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(bugUser);
			tx.commit();
		}catch(Exception e) {e.printStackTrace();}
		finally {if(session!=null)session.close();}
	}

	@Override
	public Boolean updateUserLoginHistory(Long bugUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BugUserLoginHistory updateUserLoginHistory(String ipAddress, User authUser) {
		// TODO Auto-generated method stub
		return null;
	}

}
