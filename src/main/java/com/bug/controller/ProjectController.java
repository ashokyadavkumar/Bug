package com.bug.controller;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;
import java.util.stream.Collectors;

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
import com.bug.model.Issue;
import com.bug.model.Module;
import com.bug.model.Project;
import com.bug.model.RefUserRole;
import com.bug.service.MasterService;

@SessionAttributes
@Controller
@RequestMapping("/")
public class ProjectController {
	
	
	@Autowired
	MasterService masterService;
	
	@RequestMapping(value = {"/addProject"}, method = RequestMethod.GET)
	public String addProjectGet(ModelMap model) {
		try{
			List<RefUserRole> userRoleList = masterService.getUserRoleList();
			model.addAttribute("userRoleList", userRoleList);
		}catch(Exception e){e.printStackTrace();}
		return "addProject";
	}
	@RequestMapping(value = {"/saveProject"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String saveProject(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,
			HttpServletRequest request,RedirectAttributes redirectAttributes) {
		try{
			Long userId = Long.parseLong(request.getParameter("userId"));
			userId=masterService.saveprojectDetails(commanBean);
			String msg=null;
			if(userId!= null){
				msg="Project Added Successfully";
			}else{
				msg="Project Added already Have Please Try Another Project";
			}
			redirectAttributes.addFlashAttribute("msg", msg);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
	}
	@RequestMapping(value = {"/searchProject"}, method = RequestMethod.GET)
	public String searchProjectGet(ModelMap model) {
		try{
		}catch(Exception e){e.printStackTrace();}
		return "searchProject";
	}
	@RequestMapping(value = {"/searchProject"}, method = RequestMethod.POST)
	public String searchProjectPost(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,
			RedirectAttributes redirectAttributes,HttpServletRequest request) {
		Project project=null;
		String msg=null;
		String returnReusult=null;
		try{
			project = masterService.searchByProjectId(commanBean);
			if(project!=null){
				model.addAttribute("project", project);
				returnReusult="updateProject";
			}else{
				msg="Project not there plz try another id";
				redirectAttributes.addFlashAttribute("msg", msg);
				returnReusult="redirect:/dashboardAdmin";
			}
			
		}catch(Exception e){e.printStackTrace();}
		return returnReusult;
	}
	@RequestMapping(value = {"/updateProject"}, method = RequestMethod.POST)
	public String updateProject(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,
			HttpSession session,BindingResult result,RedirectAttributes redirectAttributes,HttpServletRequest request) {
		Project project=null;
		String msg=null;
		try{
			project = masterService.updateProjectId(commanBean);
			if(project!=null){
				msg="Project Update Successfully";
			}
			redirectAttributes.addFlashAttribute("msg", msg);
			model.addAttribute("project", project);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
	}
	@RequestMapping(value = {"/showAllProject"}, method = RequestMethod.GET)
	public String viewAllProject(ModelMap model) {
		List<Project> projectList=null;
		try{
			projectList=masterService.getProjectList();
			model.addAttribute("projectList", projectList);
		}catch(Exception e){e.printStackTrace();}
		return "showAllProject";
	}
	@RequestMapping(value = {"/addModule"}, method = RequestMethod.GET)
	public String addModuleGet(ModelMap model) {
		try{
			List<Project> projectList=masterService.getProjectList();
			model.addAttribute("projectList", projectList);
		}catch(Exception e){e.printStackTrace();}
		return "addModule";
	}
	
	@RequestMapping(value = {"/addModule"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String addModulePost(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		try{
			Long userId = Long.parseLong(request.getParameter("userId"));
			userId=masterService.addModule(commanBean);
			String msg=null;
			if(userId!= null){
				msg="Module Added Successfully";
			}else{
				msg="Module Added already Have Please Try Another Project";
			}
			redirectAttributes.addFlashAttribute("msg", msg);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
	}
	@RequestMapping(value = {"/searchBugByModuleId"}, method = RequestMethod.GET)
	public String searchBugByModuleIdGet(ModelMap model) {
		try{
		}catch(Exception e){e.printStackTrace();}
		return "searchBugByModuleId";
	}
	@RequestMapping(value = {"/searchBugByModulePost"}, method = RequestMethod.POST)
	public String searchBugByModuleIdPost(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request) {
		List<Issue> issueList=null;
		try{
			issueList=masterService.getAllIssue();
			User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			BugUser bugUser = masterService.getLoggedUser(authUser.getUserid());
			model.addAttribute("bugUserRoleCode", bugUser.getRefUserRoleId().getRoleCode());
			model.addAttribute("issueList", issueList);
			model.addAttribute("data", "View BUG");
		}catch(Exception e){e.printStackTrace();}
		return "searchBugByModuleId";
	}
	
	@RequestMapping(value = {"/checkStatusandtryagain"}, method = RequestMethod.GET)
	public String checkStatusandtryagainGet(ModelMap model) {
		try{
		}catch(Exception e){e.printStackTrace();}
		return "checkStatusandtryagain";
	}
	@RequestMapping(value = {"/viewAllModule"}, method = RequestMethod.GET)
	public String viewAllModuleGet(ModelMap model) {
		try{
			List<Module> moduleList=null;
				moduleList = masterService.getAllModule();
				model.addAttribute("moduleList", moduleList);
		}catch(Exception e){e.printStackTrace();}
		return "viewAllModule";
	}
	
	@RequestMapping(value = {"/assignModule"}, method = RequestMethod.GET)
	public String assignModuleGet(ModelMap model) {
		try{
			List<Module> moduleList=null;
				moduleList = masterService.getAllModule();
				if(moduleList!=null){
					List<BugUser> bugUserList = masterService.getRoleByUser();
					model.addAttribute("bugUserList", bugUserList);
				}
				model.addAttribute("moduleList", moduleList);
		}catch(Exception e){e.printStackTrace();}
		return "assignModule";
	}

	@RequestMapping(value = {"/assignModule"}, method = RequestMethod.POST)
	@ResponseStatus(value=HttpStatus.OK)
	public String assignModulePost(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
		try{
			Long userId = null;
			userId=masterService.assignModule(commanBean);
			String msg=null;
			if(userId!= null){
				msg="Assign Module Successfully";
			}else{
				msg="Assigned Module already Have Please Try Another Module";
			}
			redirectAttributes.addFlashAttribute("msg", msg);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
	}
}
