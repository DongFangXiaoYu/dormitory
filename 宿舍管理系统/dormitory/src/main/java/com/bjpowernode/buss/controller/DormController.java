package com.bjpowernode.buss.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import org.json.JSONObject;
import com.bjpowernode.buss.entity.base.DormEntity;
import com.bjpowernode.buss.service.DormService;
import com.bjpowernode.common.controller.BaseController;
import com.bjpowernode.common.util.AjaxJson;
import com.bjpowernode.common.util.MyBeanUtils;
import com.bjpowernode.common.util.Pagination;

@Controller
@RequestMapping("/dormController")
public class DormController extends BaseController{

	private static final Logger logger = Logger.getLogger(DormController.class);
	
	@Autowired
	private DormService dormService;
	
	/**
	 * 初始访问
	 * @param 
	 * @param model
	 * @return
	 */
	@RequestMapping(params="goDorm")
    public ModelAndView goDorm(HttpServletRequest request){
        return new ModelAndView("buss/dorm");
    }
	
	@RequestMapping(params="save")
    @ResponseBody
	public AjaxJson save(HttpServletRequest request, HttpServletResponse response, DormEntity dormEntity) throws Exception {
		AjaxJson j = new AjaxJson();
		j.setMsg("保存成功！");
		j.setSuccess(true);
		try{
			dormEntity.setUsed(dormEntity.getTotal());
			this.dormService.save(dormEntity);
		}catch(Exception e){
			j.setMsg("保存失败！");
			j.setSuccess(false);
		}
		 return j;
		
	}
	
	@RequestMapping(params="update")
    @ResponseBody
	public AjaxJson update(HttpServletRequest request, HttpServletResponse response, DormEntity dormEntity) throws Exception {
		AjaxJson j = new AjaxJson();
		j.setMsg("更新成功！");
		j.setSuccess(true);
		try{
			DormEntity dorm = this.dormService.get(DormEntity.class, dormEntity.getId());
			MyBeanUtils.copyBeanNotNull2Bean(dormEntity, dorm);
			this.dormService.update(dorm);
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
				DormEntity dormEntity = new DormEntity();
				dormEntity.setId(id);
				this.dormService.delete(dormEntity);
			}
		}catch(ConstraintViolationException ce){
			ce.printStackTrace();
			j.setMsg("删除失败,存在外键引用，请查看其它数据项中是否有与当前数据有关的信息!");
			j.setSuccess(false);
		}catch(Exception e){
			j.setMsg("删除失败！");
			j.setSuccess(false);
		}
		 return j;
		
	}
	
	@RequestMapping(params="datagrid")
    @ResponseBody
	public void datagrid(HttpServletRequest request, HttpServletResponse response, DormEntity ve,String assignDorm) throws Exception {
		String page = request.getParameter("page");//easyui datagrid 分页 页号
		String rows = request.getParameter("rows");//easyui datagrid 分页 页数
		if(page == null){
			page = "0";
		}
		if(rows == null){
			rows = "0";
		}
		DetachedCriteria condition = DetachedCriteria.forClass(DormEntity.class);
		Pagination<?> pagination = dormService.findPageData(condition,ve,Integer.parseInt(page), Integer.parseInt(rows),assignDorm);
		
		JSONObject jobj = new JSONObject();  
		jobj.put("total", pagination.getTotalCount());
		jobj.put("rows", pagination.getDatas());

        response.setCharacterEncoding("utf-8");  
        response.getWriter().write(jobj.toString());  
		
	}
	
}
