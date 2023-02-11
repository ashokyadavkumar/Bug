package com.bug.controller;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bug.bean.CommanBean;
import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.RefUserRole;
import com.bug.service.MasterService;

@SessionAttributes
@Controller
@RequestMapping("/")
public class CommonController {
	
	
	@Autowired
	MasterService masterService;
	
	@RequestMapping(value = {"/createUser"}, method = RequestMethod.GET)
	public String createUserGet(ModelMap model) {
		try{
			List<RefUserRole> userRoleList = masterService.getUserRoleList();
			model.addAttribute("userRoleList", userRoleList);
		}catch(Exception e){e.printStackTrace();}
		return "createUser";
	}
	@RequestMapping(value = {"/saveMemberCredentialDetails"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String saveMemberCredentialDetails(ModelMap model,@ModelAttribute("memberRegistration") CommanBean memberRegistration,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		try{
			System.out.println("sfdf"+session.getAttribute("msg"));
			Long userId = Long.parseLong(request.getParameter("userId"));
			userId=masterService.saveMemberPersonalDetails(memberRegistration);
			String msg=null;
			if(userId!= null){
				msg="User Information Registered Successfully";
			}else{
				msg="User already Have Please Try Another EmailId And Phone Number";
			}
			redirectAttributes.addFlashAttribute("msg", msg);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
	}
	
	@RequestMapping(value = {"/searchByEmail"}, method = RequestMethod.GET)
	public String searchByEmailGet(ModelMap model) {
		try{
		}catch(Exception e){e.printStackTrace();}
		return "searchByEmail";
	}
	
	@RequestMapping(value = {"/searchByEmail"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String searchByEmail(ModelMap model,@ModelAttribute("memberRegistration") CommanBean memberRegistration,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		BugUser bugUser=null;
		try{
			bugUser = masterService.searchByEmail(memberRegistration);
			model.addAttribute("bugUser", bugUser);
		}catch(Exception e){e.printStackTrace();}
		return "searchByEmail";
	}
	
	@RequestMapping(value = {"/updateUser"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String updateUser(ModelMap model,@ModelAttribute("memberRegistration") CommanBean memberRegistration,HttpSession session,BindingResult result,HttpServletRequest request) {
		try{
			Long userId = masterService.updateuserDetails(memberRegistration);
			String msg=null;
			if(userId!= null){
				msg="User Information Update Successfully";
			}
			model.addAttribute("msg", msg);
		}catch(Exception e){e.printStackTrace();}
		return "searchByEmail";
	}
	
	@RequestMapping(value = {"/searchById"}, method = RequestMethod.GET)
	public String searchByIdGet(ModelMap model) {
		try{
		}catch(Exception e){e.printStackTrace();}
		return "searchById";
	}
	
	@RequestMapping(value = {"/searchById"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String searchById(ModelMap model,@ModelAttribute("memberRegistration") CommanBean memberRegistration,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		BugUser bugUser=null;
		try{
			bugUser = masterService.searchById(memberRegistration);
			model.addAttribute("bugUser", bugUser);
		}catch(Exception e){e.printStackTrace();}
		return "searchById";
	}

	@RequestMapping(value = {"/searchByDesignation"}, method = RequestMethod.GET)
	public String searchByDesignationGet(ModelMap model) {
		try{
			List<RefUserRole> userRoleList = masterService.getUserRoleList();
			model.addAttribute("userRoleList", userRoleList);
		}catch(Exception e){e.printStackTrace();}
		return "searchByDesignation";
	}
	
	@RequestMapping(value = {"/searchByDesignation"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String searchByDesignation(ModelMap model,@ModelAttribute("memberRegistration") CommanBean memberRegistration,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		List<BugUser> bugUser=null;
		try{
			bugUser = masterService.searchByDesignation(memberRegistration);
			List<RefUserRole> userRoleList = masterService.getUserRoleList();
			model.addAttribute("userRoleList", userRoleList);
			model.addAttribute("bugUser", bugUser);
		}catch(Exception e){e.printStackTrace();}
		return "searchByDesignation";
	}
}
