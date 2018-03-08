package com.bjpowernode.buss.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.json.JSONObject;
import com.bjpowernode.buss.entity.base.StudentEntity;
import com.bjpowernode.buss.entity.base.VisitorEntity;
import com.bjpowernode.buss.service.VisitorService;
import com.bjpowernode.common.controller.BaseController;
import com.bjpowernode.common.util.AjaxJson;
import com.bjpowernode.common.util.Pagination;

@Controller
@RequestMapping("/visitorController")
public class VisitorController extends BaseController{

	private static final Logger logger = Logger.getLogger(VisitorController.class);
	
	@Autowired
	private VisitorService visitorService;
	
	/**
	 * 初始访问
	 * @param 
	 * @param model
	 * @return
	 */
	@RequestMapping(params="goVisitor")
    public ModelAndView goVisitor(HttpServletRequest request){
        return new ModelAndView("buss/visitor");
    }
	
	@RequestMapping(params="save")
    @ResponseBody
	public AjaxJson save(HttpServletRequest request, HttpServletResponse response, VisitorEntity visitorEntity,String studentid) throws Exception {
		AjaxJson j = new AjaxJson();
		j.setMsg("保存成功！");
		j.setSuccess(true);
		try{
			StudentEntity se = this.visitorService.get(StudentEntity.class, studentid);
			visitorEntity.setStudent(se);
			this.visitorService.save(visitorEntity);
		}catch(Exception e){
			j.setMsg("保存失败！");
			j.setSuccess(false);
		}
		 return j;
		
	}
	
	@RequestMapping(params="update")
    @ResponseBody
	public AjaxJson update(HttpServletRequest request, HttpServletResponse response, VisitorEntity visitorEntity,String studentid) throws Exception {
		AjaxJson j = new AjaxJson();
		j.setMsg("更新成功！");
		j.setSuccess(true);
		try{
			StudentEntity se = this.visitorService.get(StudentEntity.class, studentid);
			visitorEntity.setStudent(se);
			this.visitorService.update(visitorEntity);
		}catch(Exception e){
			j.setMsg("更新失败！");
			j.setSuccess(false);
		}
		 return j;
		
	}
	
	@RequestMapping(params="delete",method=RequestMethod.POST)
    @ResponseBody
	public AjaxJson delete(HttpServletRequest request, HttpServletResponse response, String ids) throws Exception {
		AjaxJson j = new AjaxJson();
		j.setMsg("删除成功！");
		j.setSuccess(true);
		try{
			for(String id:ids.split(",")){
				VisitorEntity visitorEntity = new VisitorEntity();
				visitorEntity.setId(id);
				this.visitorService.delete(visitorEntity);
			}
		}catch(Exception e){
			j.setMsg("删除失败！");
			j.setSuccess(false);
		}
		 return j;
		
	}
	
	@RequestMapping(params="datagrid")
    @ResponseBody
	public void datagrid(HttpServletRequest request, HttpServletResponse response, VisitorEntity ve,String studentname) throws Exception {
		String page = request.getParameter("page");//easyui datagrid 分页 页号
		String rows = request.getParameter("rows");//easyui datagrid 分页 页数
		if(page == null){
			page = "0";
		}
		if(rows == null){
			rows = "0";
		}
		DetachedCriteria condition = DetachedCriteria.forClass(VisitorEntity.class);
		Pagination<?> pagination = visitorService.findPageData(condition,ve,Integer.parseInt(page), Integer.parseInt(rows),studentname);
		
		JSONObject jobj = new JSONObject();
		jobj.put("total", pagination.getTotalCount());
		jobj.put("rows", pagination.getDatas());

        response.setCharacterEncoding("utf-8");  
        response.getWriter().write(jobj.toString());
		
	}
	
}
