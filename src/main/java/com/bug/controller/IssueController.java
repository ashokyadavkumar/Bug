package com.bug.controller;

import java.util.List;

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
import com.bug.bean.IssueBean;
import com.bug.loginbean.User;
import com.bug.model.BugUser;
import com.bug.model.Issue;
import com.bug.model.RefUserRole;
import com.bug.service.MasterService;

@SessionAttributes
@Controller
@RequestMapping("/")
public class IssueController {
	
	
	@Autowired
	MasterService masterService;
	
	@RequestMapping(value = {"/postBug"}, method = RequestMethod.GET)
	public String postBugGet(ModelMap model) {
		
		return "postBug";
	}
	
	@RequestMapping(value = {"/postBug"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String postBugPost(ModelMap model,@ModelAttribute("issueBean") IssueBean issueBean,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		String returnValue = "";
		try{
			User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
			issueBean.setUserId(bugUser.getId());
			issueBean=masterService.getModuleById(issueBean);
			String msg=null;
			if(issueBean!= null){
				//add some logic
				model.addAttribute("msg", msg);
				model.addAttribute("issueBean", issueBean);
				model.addAttribute("bugUser", bugUser);
				returnValue="last-3";
			}else{
				msg="Not Assigned Module Plz Try Another Module";
				redirectAttributes.addFlashAttribute("msg", msg);
				returnValue="redirect:/dashboardAdmin";
			}
			
		}catch(Exception e){e.printStackTrace();}
		return returnValue;
	}
	@RequestMapping(value = {"/saveBug"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String saveBug(ModelMap model,@ModelAttribute("issueBean") IssueBean issueBean,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		try{
		String msg=null;
		Long userId=null;
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
		issueBean.setUserId(bugUser.getId());
		userId=masterService.saveBug(issueBean);
		if(issueBean!= null){
			msg="Bug Added Successfully";
		}else{
			msg="Not Assigned Module Plz Try Another Module";
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
	}
	
	@RequestMapping(value = {"/showAllBug"}, method = RequestMethod.GET)
	public String showAllBugGet(ModelMap model) {
		List<Issue> issueList=null;
		try{
			issueList=masterService.getAllIssue();
			User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
			model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
			model.addAttribute("issueList", issueList);
			model.addAttribute("data", "Show All BUG'S");
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return "showAllBug";
	}
	
	@RequestMapping(value = {"/bugById"}, method = RequestMethod.GET)
	public String bugByIdGet(ModelMap model) {
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
		model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
		return "bugById";
	}
	@RequestMapping(value = {"/bugById"}, method = RequestMethod.POST)
	public String bugByIdPost(ModelMap model,@ModelAttribute("issueBean") IssueBean issueBean) {
		List<Issue> issueList=null;
		try{
			issueList=masterService.getAllIssueCondition(issueBean);
			User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
			model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
			model.addAttribute("issueList", issueList);
		}catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("data", "View BUG By Id");
		return "showAllBug";
	}
	
	@RequestMapping(value = {"/bugByseverity"}, method = RequestMethod.GET)
	public String bugByseverityGet(ModelMap model) {
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
		model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
		return "bugByseverity";
	}
	@RequestMapping(value = {"/bugByseverity"}, method = RequestMethod.POST)
	public String bugByseverityPost(ModelMap model,@ModelAttribute("issueBean") IssueBean issueBean) {
		List<Issue> issueList=null;
		try{
			issueList=masterService.getAllIssueCondition(issueBean);
			User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
			model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
			model.addAttribute("issueList", issueList);
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("data", "View BUG By severity");
		return "showAllBug";
	}
	
	@RequestMapping(value = {"/bugByStatus"}, method = RequestMethod.GET)
	public String bugByStatusGet(ModelMap model) {
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
		model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
		return "bugByStatus";
	}
	@RequestMapping(value = {"/bugByStatus"}, method = RequestMethod.POST)
	public String bugByStatusPost(ModelMap model,@ModelAttribute("issueBean") IssueBean issueBean) {
		List<Issue> issueList=null;
		try{
			issueList=masterService.getAllIssueCondition(issueBean);
			model.addAttribute("issueList", issueList);
			User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
			model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
		}catch (Exception e) {
			// TODO: handle exception
		}
		model.addAttribute("data", "View BUG By Id");
		return "showAllBug";
	}
	
	@RequestMapping(value = {"/updateByBug"}, method = RequestMethod.GET)
	public String updateBugGet(ModelMap model) {
		List<Issue> issueList=null;
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
		issueList=masterService.getAllIssue();
		model.addAttribute("issueList", issueList);
		model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
		
		return "updateByBug";
	}
	@RequestMapping(value = {"/searchBugId"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String searchBugIdPost(ModelMap model,@ModelAttribute("issueBean") IssueBean issueBean,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		String returnValue = "";
		List<Issue> issueList=null;
		try{
			User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
			issueBean.setUserId(bugUser.getId());
			issueList=masterService.getAllIssueCondition(issueBean);
			model.addAttribute("issueList", issueList.get(0));
			String msg=null;
			if(issueBean!= null){
				//add some logic
				model.addAttribute("msg", msg);
				model.addAttribute("issueBean", issueBean);
				model.addAttribute("bugUser", bugUser);
				returnValue="last-4";
				model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
			}else{
				msg="Not Assigned Module Plz Try Another Module";
				redirectAttributes.addFlashAttribute("msg", msg);
				returnValue="redirect:/dashboardAdmin";
			}
			
		}catch(Exception e){e.printStackTrace();}
		return returnValue;
	
}
	
	@RequestMapping(value = {"/updateBug"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String updateBug(ModelMap model,@ModelAttribute("issueBean") IssueBean issueBean,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		try{
		String msg=null;
		Long userId=null;
		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
		issueBean.setUserId(bugUser.getId());
		userId=masterService.updateBug(issueBean);
		if(issueBean!= null){
			msg="Bug Update Successfully";
		}else{
			msg="Not Assigned Module Plz Try Another Module";
		}
		redirectAttributes.addFlashAttribute("msg", msg);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
	}
}
