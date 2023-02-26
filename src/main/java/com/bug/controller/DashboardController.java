package com.bug.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.service.MasterService;



@Controller
@RequestMapping("/")
//@PreAuthorize("isAuthenticated()")
public class DashboardController {
	
	
	@Autowired
	MasterService masterService;
	
	@RequestMapping(value={"/dashboardAdmin"},method=RequestMethod.GET )
	public String dashboardAdmin(Model model){
		 String msg = (String)model.asMap().get("msg");
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
		model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
		model.addAttribute("bugUser", bugUser);
		
		model.addAttribute("msg", msg);
		model.addAttribute("bugUserRoleName", bugUser.getRefUserRoleId().getRoleName());
		
		return "dashboardAdmin";
	}
	
	
	
}
