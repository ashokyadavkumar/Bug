package com.bug.daoImpl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.bug.bean.CommanBean;
import com.bug.dao.MasterDao;
import com.bug.model.BugUser;
import com.bug.model.BugUserDraft;
import com.bug.model.BugUserPasswordChangeRequest;
import com.bug.model.Module;
import com.bug.model.Project;
import com.bug.model.RefCountry;
import com.bug.model.RefDistrict;
import com.bug.model.RefState;
import com.bug.model.RefUserRole;

@Repository("MasterDao")
@Transactional
public class MasterDaoImpl implements MasterDao {
	@Autowired
	private SessionFactory sessionFactory;
	private Session session;

	public Session getSession() {
		session = sessionFactory.openSession();
		return session;
	}


	@Override
	public BugUser getLoggedUser(Long userId) {
		Session session = sessionFactory.openSession();
		BugUser bugUser = null;
		try {
			bugUser = (BugUser) session.createCriteria(BugUser.class).add(Restrictions.eq("id", userId)).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bugUser;
	}

	@Override
	public BugUser getUserByLoginName(String userName) {
		Session session = sessionFactory.openSession();
		BugUser bugUser = null;
		try {
			bugUser = (BugUser) session.createCriteria(BugUser.class).add(Restrictions.eq("userName", userName))
					.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bugUser;
	}

	@Override
	public <T> T savePojo(T t) throws Exception {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(t);
			session.flush();
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			throw e;
		} finally {
			if (session != null)
				session.close();
		}
		return t;
	}

	@Override
	public BugUserPasswordChangeRequest getPasswordChangeRequest(String enctype) {
		Session session = sessionFactory.openSession();
		BugUserPasswordChangeRequest bugUser = null;
		try {
			bugUser = (BugUserPasswordChangeRequest) session.createCriteria(BugUserPasswordChangeRequest.class)
					.add(Restrictions.eq("encType", enctype)).add(Restrictions.eq("isDeleted", false)).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bugUser;
	}


	@Override
	public List<RefUserRole> getUserRoleList() {
		Session session = sessionFactory.openSession();
		List<RefUserRole> userRoleList = null;
		try {
			userRoleList = (List<RefUserRole>) session.createCriteria(RefUserRole.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return userRoleList;
	}


	@Override
	public Long saveMemberPersonalDetails(CommanBean memberRegistration) {
		Session session = sessionFactory.openSession();
		Long userId = null;
		BugUser bugUser = null;
		if (memberRegistration.getEmail() != null && !memberRegistration.getEmail().equalsIgnoreCase(""))
			bugUser = (BugUser) session.createCriteria(BugUser.class)
					.add(Restrictions.or(Restrictions.eq("email", memberRegistration.getEmail()),
							Restrictions.eq("mobile", memberRegistration.getMobile())))
					.uniqueResult();
		else if (memberRegistration.getUserName() != null && !memberRegistration.getUserName().equalsIgnoreCase(""))
			bugUser = (BugUser) session.createCriteria(BugUser.class)
					.add(Restrictions.eq("userName", memberRegistration.getUserName())).uniqueResult();
		if (bugUser != null) {
			return userId;
		} else {
			try {
				BugUser bugUserDraft = (BugUser) session.createCriteria(BugUserDraft.class)
						.add(Restrictions.eq("id", memberRegistration.getUserId())).uniqueResult();
				if (bugUserDraft == null) {
					bugUserDraft = new BugUser();
					bugUserDraft.setFirstName(memberRegistration.getFirstName());
					bugUserDraft.setMiddleName(
							memberRegistration.getMiddleName() != null ? memberRegistration.getMiddleName() : null);
					bugUserDraft.setLastName(memberRegistration.getLastName());
					bugUserDraft.setEmail(memberRegistration.getEmail());
					RefCountry country = new RefCountry();
					country.setId(1L);
					bugUserDraft.setRefCountryId(country);
					RefState state = new RefState();
					state.setId(1L);
					RefDistrict dist = new RefDistrict();
					dist.setId(1L);
					//bugUserDraft.setRefStateId(state);
					bugUserDraft.setRefDistrictId(dist);
					bugUserDraft.setPincode(memberRegistration.getPincode());
					bugUserDraft.setPhoneNumber(
							memberRegistration.getPhoneNumber() != null ? memberRegistration.getPhoneNumber() : null);
					bugUserDraft.setMobile(memberRegistration.getMobile());
					bugUserDraft.setStatus(memberRegistration.getStatus());
					bugUserDraft.setUserName(memberRegistration.getUserName());
					bugUserDraft.setUserPassword(memberRegistration.getUserPassword());
					bugUserDraft.setIsDeleted(false);
					bugUserDraft.setUpdatedOn(new Date());
					RefUserRole refUserRole = new RefUserRole();
					refUserRole.setId(memberRegistration.getRefUserRoleId());
					bugUserDraft.setRefUserRoleId(refUserRole);
					session.saveOrUpdate(bugUserDraft);
					userId = bugUserDraft.getId();
					session.flush();
				} else {
					bugUserDraft.setFirstName(memberRegistration.getFirstName());
					bugUserDraft.setMiddleName(
							memberRegistration.getMiddleName() != null ? memberRegistration.getMiddleName() : null);
					bugUserDraft.setLastName(memberRegistration.getLastName());
					bugUserDraft.setEmail(memberRegistration.getEmail());
					RefCountry country = new RefCountry();
					country.setId(1L);
					bugUserDraft.setRefCountryId(country);
					RefState state = new RefState();
					RefDistrict dist = new RefDistrict();
					//bugUserDraft.setRefStateId(state);
					bugUserDraft.setRefDistrictId(dist);
					bugUserDraft.setPincode(memberRegistration.getPincode());
					bugUserDraft.setStatus(memberRegistration.getStatus());
					bugUserDraft.setPhoneNumber(
							memberRegistration.getPhoneNumber() != null ? memberRegistration.getPhoneNumber() : null);
					bugUserDraft.setMobile(memberRegistration.getMobile());
					bugUserDraft.setUserName(memberRegistration.getUserName());
					bugUserDraft.setUserPassword(memberRegistration.getUserPassword());
					bugUserDraft.setIsDeleted(false);
					bugUserDraft.setUpdatedOn(new Date());
					session.saveOrUpdate(bugUserDraft);
					userId = bugUserDraft.getId();
					session.flush();
				}
				if (bugUserDraft != null)
					userId = bugUserDraft.getId();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
			return userId;
		}
	}


	@Override
	public BugUser searchByEmail(CommanBean memberRegistration) {
		Session session = sessionFactory.openSession();
		BugUser bugUser = null;
		try {
			if (memberRegistration.getEmail() != null && !memberRegistration.getEmail().equalsIgnoreCase(""))
			bugUser = (BugUser) session.createCriteria(BugUser.class).add(Restrictions.eq("email", memberRegistration.getEmail())).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bugUser;
	}


	@Override
	public BugUser searchById(CommanBean memberRegistration) {
		Session session = sessionFactory.openSession();
		BugUser bugUser = null;
		RefUserRole refUserRole = null;
		try {
			if (memberRegistration.getRefUserRoleId() != null ){
				//refUserRole = (RefUserRole) session.createCriteria(RefUserRole.class).add(Restrictions.eq("roleCode", memberRegistration.getRefUserRoleId())).uniqueResult();

			}
			bugUser = (BugUser) session.createCriteria(BugUser.class).add(Restrictions.eq("refUserRoleId.id", memberRegistration.getRefUserRoleId())).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bugUser;
	}


	@Override
	public List<BugUser> searchByDesignation(CommanBean memberRegistration) {
		Session session = sessionFactory.openSession();
		List<BugUser> bugUser = null;
		try {
			if (memberRegistration.getRefUserRoleId() != null && memberRegistration.getRefUserRoleId()==100){
				bugUser = (List<BugUser>) session.createCriteria(BugUser.class).list();
			}else {
				bugUser = (List<BugUser>) session.createCriteria(BugUser.class).add(Restrictions.eq("refUserRoleId.id", memberRegistration.getRefUserRoleId())).list();

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bugUser;
	}


	@Override
	public Long updateuserDetails(CommanBean memberRegistration) {
		Session session = sessionFactory.openSession();
		BugUser bugUserDraft = null;
		Long userId=null;
		try {
			bugUserDraft = (BugUser) session.createCriteria(BugUser.class).add(Restrictions.eq("id", memberRegistration.getUserId())).uniqueResult();
			if(bugUserDraft!=null){
				
				bugUserDraft.setFirstName(memberRegistration.getFirstName());
				bugUserDraft.setEmail(memberRegistration.getEmail());
				bugUserDraft.setPhoneNumber(
						memberRegistration.getPhoneNumber() != null ? memberRegistration.getPhoneNumber() : null);
				bugUserDraft.setMobile(memberRegistration.getMobile());
				bugUserDraft.setStatus(memberRegistration.getStatus());
				bugUserDraft.setUserName(memberRegistration.getUserName());
				bugUserDraft.setUpdatedOn(new Date());
				session.saveOrUpdate(bugUserDraft);
				userId = bugUserDraft.getId();
				session.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return userId;
	}


	@Override
	public Long saveprojectDetails(CommanBean commanBean) {
		Session session = sessionFactory.openSession();
		Long userId = null;
		Project project = null;
		if (commanBean.getProjectName() != null && !commanBean.getProjectName().equalsIgnoreCase(""))
			project = (Project) session.createCriteria(Project.class)
					.add(Restrictions.or(Restrictions.eq("projectName", commanBean.getProjectName())))
					.uniqueResult();
		if (project != null) {
			return userId;
		} else {
			try {
					Project projects = new Project();
					projects.setProjectName(commanBean.getProjectName());
					projects.setClientName(commanBean.getClientName());
					projects.setProjectStartDate(commanBean.getProjectStartDate());
					projects.setStatus(commanBean.getStatus());
					projects.setIsDeleted(false);
					session.saveOrUpdate(projects);
					userId = projects.getId();
					session.flush();
				if (projects != null)
					userId = projects.getId();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
			return userId;
		}
	}


	@Override
	public Project searchByProjectId(CommanBean commanBean) {
		Session session = sessionFactory.openSession();
		Project project = null;
		try {
			project = (Project) session.createCriteria(Project.class).add(Restrictions.eq("id", commanBean.getLoginId())).uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return project;
	}


	@Override
	public Project updateProjectId(CommanBean commanBean) {
		Session session = sessionFactory.openSession();
		Project project = null;
		try {
			project = (Project) session.createCriteria(Project.class).add(Restrictions.eq("id", commanBean.getUserId())).uniqueResult();
		
			if(project!=null){
				project.setStatus(commanBean.getStatus());
				project.setIsDeleted(false);
				session.saveOrUpdate(project);
				session.flush();
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return project;
	}


	@Override
	public List<Project> getProjectList() {
		Session session = sessionFactory.openSession();
		List<Project> projectList = null;
		try {
			projectList = (List<Project>) session.createCriteria(Project.class).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return projectList;
	}


	@Override
	public Long addModule(CommanBean commanBean) {
		Session session = sessionFactory.openSession();
		Long userId = null;
		Module project = null;
		if (commanBean.getModuleName() != null && !commanBean.getModuleName().equalsIgnoreCase(""))
			project = (Module) session.createCriteria(Module.class)
					.add(Restrictions.or(Restrictions.eq("moduleName", commanBean.getModuleName())))
					.uniqueResult();
		if (project != null) {
			return userId;
		} else {
			try {
				Module module = new Module();
				module.setModuleName(commanBean.getModuleName());
					Project project1 = new Project();
					project1.setId(commanBean.getProjectId());
					module.setProjectId(project1);
					module.setStatus(commanBean.getStatus());
					module.setIsDeleted(false);
					session.saveOrUpdate(module);
					userId = module.getId();
					session.flush();
				if (module != null)
					userId = module.getId();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
			return userId;
		
	}
	}

}