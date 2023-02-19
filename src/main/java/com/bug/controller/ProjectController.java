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
	public String saveProject(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request,RedirectAttributes redirectAttributes) {
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
	public String searchProjectPost(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request) {
		Project project=null;
		try{
			project = masterService.searchByProjectId(commanBean);
			model.addAttribute("project", project);
		}catch(Exception e){e.printStackTrace();}
		return "updateProject";
	}
	@RequestMapping(value = {"/updateProject"}, method = RequestMethod.POST)
	public String updateProject(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request) {
		Project project=null;
		String msg=null;
		try{
			project = masterService.updateProjectId(commanBean);
			if(project!=null){
				msg="Project Update Successfully";
			}
			model.addAttribute("project", project);
		}catch(Exception e){e.printStackTrace();}
		return "redirect:/dashboardAdmin";
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
	@RequestMapping(value = {"/searchBugByModuleId"}, method = RequestMethod.POST)
	public String searchBugByModuleIdGet(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request) {
		try{
		}catch(Exception e){e.printStackTrace();}
		return "searchBugByModuleId";
	}
	@RequestMapping(value = {"/searchBugByModulePost"}, method = RequestMethod.POST)
	public String searchBugByModuleIdPost(ModelMap model,@ModelAttribute("commanBean") CommanBean commanBean,HttpSession session,BindingResult result,HttpServletRequest request) {
		Project project=null;
		try{
			project = masterService.searchByProjectId(commanBean);
			model.addAttribute("project", project);
		}catch(Exception e){e.printStackTrace();}
		return "updateProject";
	}
}
