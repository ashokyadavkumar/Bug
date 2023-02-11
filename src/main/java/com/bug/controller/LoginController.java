package com.bug.controller;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.BugUserPasswordChangeRequest;
import com.bug.service.MasterService;
import com.bug.util.BugRandom;



@Controller
@RequestMapping("/")
public class LoginController {
	
	
	@Autowired
	MasterService masterService;
	private String uuid;
	private String enctype;
	@Autowired
	private SessionFactory sessionFactory;
	
	@RequestMapping(value={"/login"},method={RequestMethod.GET,RequestMethod.POST})
	//@ResponseBody
	public String login(HttpServletRequest request,ModelMap model,HttpSession session){
		try{
			session.removeAttribute("msg");
			String contextPath = request.getServletContext().getRealPath("/");
			CaptureController ch=new CaptureController();
			String capture=ch.randomString() ;
			final BufferedImage image = ImageIO.read(new File(
					contextPath+"/WEB-INF/resources/images/captchaBg.png"));

			Graphics g = image.getGraphics();
			g.setFont(g.getFont().deriveFont(200f));
			g.fillRect(0, 0, 60, 30);
			g.drawString(capture, 200, 150);
			g.dispose();

			ImageIO.write(image, "png", new File(contextPath+"/WEB-INF/resources/images/test.png"));


			session.setAttribute("oldcap", capture);
			model.addAttribute("newcap", capture);
		}catch(Exception e){e.printStackTrace();}
		//request.getSession().invalidate();
		return "login";
	}
	
	@RequestMapping(value={"/logout"},method={RequestMethod.GET,RequestMethod.POST} )
	//@ResponseBody
	public String logout(ModelMap model){
		 /*Authentication authentication = SecurityContextHolder.getContext()
	                .getAuthentication();
	        authentication.setAuthenticated(false);*/
	       // request.getSession().invalidate();
		Authentication authentication = SecurityContextHolder.getContext()
                .getAuthentication();
        authentication.setAuthenticated(false);
        
        model.addAttribute("logout", "true");
		return "login";
	}

	
	@RequestMapping(value="/accessDenied", method = RequestMethod.GET)
	public String accessDenied () {
		System.out.println("helloc check");
		return "AccessDenied";
	}
	
	@RequestMapping(value = { "/refreshCaptcha" }, method = RequestMethod.GET)
	@ResponseBody
	public String refreshCaptcha(HttpServletRequest request,ModelMap model,HttpSession session){
		BufferedImage image = null;
		try{
		CaptureController ch=new CaptureController();
		String capture=ch.randomString() ;
		String contextPath = request.getServletContext().getRealPath("/");
		image = ImageIO.read(new File(
				contextPath+"/WEB-INF/resources/images/captchaBg.png"));

		Graphics g = image.getGraphics();
		g.setFont(g.getFont().deriveFont(200f));
		g.fillRect(0, 0, 60, 30);
		g.drawString(capture, 200, 150);
		g.dispose();

		ImageIO.write(image, "png", new File(contextPath+"/WEB-INF/resources/images/test.png"));


		session.setAttribute("oldcap", capture);
		model.addAttribute("newcap", capture);
		}catch(Exception e){e.printStackTrace();}
		return "images/test.png";
	}
	
	
	@RequestMapping(value="/forgetPassword", method = RequestMethod.GET)
	public String forgetPassword () {
		System.out.println("helloc check");
		return "forgetPassword";
	}

	@RequestMapping(value="/forgetPasswordSubmit", method = RequestMethod.POST)
	public String forgetPasswordSubmit (HttpServletRequest servletRequest,ModelMap model1,@RequestParam("userName") String userName) {
		String ip = servletRequest.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = servletRequest.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = servletRequest.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = servletRequest.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = servletRequest.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = servletRequest.getRemoteAddr();  
        }
        try{
	/*CercUserLoginHistory cercUserLoginHistory = new CercUserLoginHistory();
	cercUserLoginHistory.setIpAddress(ip);
	cercUserLoginHistory.setLoginDate(new Date(servletRequest.getSession().getCreationTime()));
	cercUserLoginHistory.setLoginUser(userName);
	//cercUserLoginHistory.setProcessId(servletRequest.getRequestedSessionId());
	cercUserLoginHistory.setReferrer(servletRequest.getHeader("referer"));
	cercUserLoginHistory.setSessionDetails("Content-Type: "+servletRequest.getHeader("Content-Type")+";Content-Length: "+servletRequest.getHeader("Content-Length"));
	cercUserLoginHistory.setUrl(servletRequest.getRequestURL().toString());
	cercUserLoginHistory.setUserAgent(servletRequest.getHeader("user-agent"));*/


	
		
		//String pass = "";
		BugUser bugUser=null;
		if(userName!=null){
			bugUser = masterService.getUserByLoginName(userName);
			//lmUser = new LmUser();
		}
		/*else{
			cercUser = masterService.getAnyPojoRow(CercUser.class, "email", email);
		}*/
		if(bugUser!=null){
			//servletRequest.setAttribute("uPass", ESAPI.validator().getValidInput("pass", pass, "InputString", pass.length(), false));
			//uPass = pass;
			//RefConfiguration rootURL = masterService.getAnyPojoRow(RefConfiguration.class, "constantName","rootURL");
			String rootURL ="http://localhost:8080/bug/";
			//cercUser.setUserPassword(CercRandom.encrypt(pass));
			//cercUser.setUpdatedOn(new Date());
			//user = cercUser.getUserId();
			//servletRequest.setAttribute("user", ESAPI.validator().getValidInput("pass", cercUser.getUserId(), "InputString", cercUser.getUserId().length(), false));
			//servletRequest.setAttribute("url", rootURL.getConstantValue());
			//masterService.savePojo(cercUser);
			//return "sendMailForgotPassword";
			Date updatedOn = new Date();
			BugUserPasswordChangeRequest cercUserResetPasswordRequestMapping = new BugUserPasswordChangeRequest();
			cercUserResetPasswordRequestMapping.setLmUser(bugUser);
			cercUserResetPasswordRequestMapping.setIsDeleted(false);
			cercUserResetPasswordRequestMapping.setRequestedOn(updatedOn);
			cercUserResetPasswordRequestMapping.setUpdatedBy(bugUser.getId());
			cercUserResetPasswordRequestMapping.setUpdatedOn(updatedOn);
			masterService.savePojo(cercUserResetPasswordRequestMapping);
			uuid = BugRandom.encrypt(String.valueOf(bugUser.getId().longValue()));
			enctype = BugRandom.randomUserId(32);
			//enctype = enctype.replace("[","");
			//enctype = CercRandom.encrypt(userName)+CercRandom.encrypt(String.valueOf(cercUserResetPasswordRequestMapping.getId()))+CercRandom.encrypt(String.valueOf(updatedOn.getTime()));
			String token = "resetPassword?&uuid="+uuid+"&enctype="+enctype;
			String url = rootURL+token;
			cercUserResetPasswordRequestMapping.setEncType(enctype);
			masterService.savePojo(cercUserResetPasswordRequestMapping);
			Map<String,Object> model = new HashMap<String,Object>();
			//model.put("uPass",uPass);
			model.put("lmUser", bugUser);
			model.put("url",url);
			//communicationService.mailSenderVelocityTemplate(lmUser.getEmail(), "DPIIT G2B Portal Forget Password Acknowlegement", model);
			/*if(lmUser.getMobile()!=null){
			String messageText = rb.getProperty( "FORGET_PASSWORD_MESSAGE_TEXT");
			masterService.cercHttpSMSUtility(lmUser.getMobile(), messageText);
			}*/
			//cercUser.setUserPassword(CercRandom.encrypt(pass));
			//cercUser.setUpdatedOn(new Date());
			//masterService.savePojo(cercUser);
			return "forgotPasswordSuccess";
			//session.remove("CERC_USER");
		}
		else{
			if(userName!=null && !userName.trim().equalsIgnoreCase(""))
				model1.addAttribute("msg","Entered User Id does not exists.");
			return "forgetPassword";
		}
        }catch(Exception e){e.printStackTrace();}
        return null;
		
	}
	
	@RequestMapping(value="/resetPassword", method = RequestMethod.GET)
	public String resetPassword(HttpServletRequest servletRequest,ModelMap model,@RequestParam("enctype") String enctype) throws Exception{
		BugUserPasswordChangeRequest cercUserResetPasswordRequestMapping = (BugUserPasswordChangeRequest)masterService.getPasswordChangeRequest(enctype);//
		/*getHibernateSession().createCriteria(LmUserPasswordChangeRequest.class)
			.add(Restrictions.eq("encType", enctype))
			.uniqueResult();*/
		if(cercUserResetPasswordRequestMapping==null){
			//returnType="urlExpired";
			model.addAttribute("msg","The requested URL is not valid or expired.");
			return "/login";
		}
		else if(cercUserResetPasswordRequestMapping!=null && (new Date().getTime()-cercUserResetPasswordRequestMapping.getRequestedOn().getTime())/(60*1000)>30){
			//returnType="urlExpired";
			model.addAttribute("msg","The requested URL is not valid or expired.");
			return "/login";
		}
		else{
			//session.put("enctype",enctype);
		}
		return "resetPassword";
	}
	
	@RequestMapping(value="/resetPasswordSubmit", method = RequestMethod.POST)
	public String resetPasswordSubmit(ModelMap model,@RequestParam("enctype") String enctype,@RequestParam("newPassword") String newPassword,@RequestParam("reTypeNewPassword") String reTypeNewPassword,HttpSession session) throws Exception{
		//enctype = session.get("enctype").toString();
		try{
		BugUserPasswordChangeRequest cercUserResetPasswordRequestMapping = (BugUserPasswordChangeRequest)masterService.getPasswordChangeRequest(enctype);
		Long userId = cercUserResetPasswordRequestMapping.getLmUser().getId();
		BugUser lmUser = masterService.getLoggedUser(userId);
		
		//String phash = session.get("phash").toString();
		//String encryptedPassword = null;
		//encryptedPassword = CercRandom.encrypt(cercUser.getUserPassword().trim()+phash.trim());
		if(newPassword.trim().equalsIgnoreCase("")||reTypeNewPassword.trim().equalsIgnoreCase("")){
			model.addAttribute("msg","Password cann't be blank.");
			return "forward:/resetPassword";
		}
		lmUser.setUserPassword(newPassword);
		lmUser.setUpdatedBy(lmUser.getId());
		lmUser.setUpdatedOn(new Date());
		masterService.savePojo(lmUser);
		model.addAttribute("msg","Password has been reset.");
		cercUserResetPasswordRequestMapping.setIsDeleted(true);
		masterService.savePojo(cercUserResetPasswordRequestMapping);// getHibernateSession().createQuery("delete from CercUserResetPasswordRequestMapping where cercUserId=?").setParameter(0, cercUser).executeUpdate();
		return "/login";
		}catch(Exception e){e.printStackTrace();}
		return null;
	}
	
	@RequestMapping(value="/changePassword", method = RequestMethod.GET)
	public String changePassword(HttpServletRequest servletRequest,ModelMap model) throws Exception{
		Session session = sessionFactory.openSession();
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("userId",authUser.getUserid());
		model.addAttribute("roleId",authUser.getRoleid());
		
		return "changePassword";
	}
	
	@RequestMapping(value="/changePasswordSubmit", method = RequestMethod.POST)
	public String changePasswordSubmit(ModelMap model,@RequestParam("userId") Long userId,@RequestParam("password") String password,@RequestParam("newPassword") String newPassword,@RequestParam("reTypeNewPassword") String reTypeNewPassword,HttpSession session) throws Exception{
		//enctype = session.get("enctype").toString();
		String phash = session.getAttribute("phash").toString();
		Session session1 = sessionFactory.openSession();
		try{
			BugUser bugUser = masterService.getLoggedUser(userId);
			String encryptedPassword = BugRandom.encrypt(bugUser.getUserPassword().trim()+phash.trim());
			if(encryptedPassword.equals(password)){
				bugUser.setUserPassword(newPassword);
				bugUser.setUpdatedBy(bugUser.getId());
				bugUser.setUpdatedOn(new Date());
				masterService.savePojo(bugUser);
				model.addAttribute("msg","Password has been changed.Login with new password");
				return "/login";
				
			}else{model.addAttribute("msg","your existing password is wrong");return "/changePassword";}
			
			
		}catch(Exception e){e.printStackTrace();}return null;}
	

}
