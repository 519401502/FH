package com.fh.controller.system.home;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.system.home.HomeService;
import com.fh.util.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 类名称：HomeController
 * 创建人：FH
 * 创建时间：2017-07-12
 */
@Controller
@RequestMapping(value = "/home")
public class HomeController extends BaseController {

    String menuUrl = "home/list.do"; //菜单地址(权限用)
    @Resource(name = "homeService")
    private HomeService homeService;

    /**
     * 新增
     */
    @RequestMapping(value = "/save")
    public ModelAndView save(
            @RequestParam(value = "tp1", required = false) MultipartFile file1,
            @RequestParam(value = "tp2", required = false) MultipartFile file2,
            @RequestParam(value = "tp3", required = false) MultipartFile file3
    ) throws Exception {
        logBefore(logger, "新增Pictures");
        Map<String, String> map = new HashMap<String, String>();
        String ffile = "home";
        PageData pd = new PageData();
        pd = this.getPageData();
        String fileName = "";
        boolean isChange= false;
        if (Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            List<PageData> varList = homeService.listAll(pd);    //列出Home列表
            if(varList != null && varList.size() > 0){
                pd = varList.get(0);
            }
            if (null != file1 && !file1.isEmpty()) {
                isChange = true;
                String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;        //文件上传路径
                fileName = FileUpload.fileUp(file1, filePath, this.get32UUID());                //执行上传
                pd.put("PIC1", ffile + "/" + fileName);                //路径
            }
            if (null != file2 && !file2.isEmpty()) {
                isChange = true;
                String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;        //文件上传路径
                fileName = FileUpload.fileUp(file2, filePath, this.get32UUID());                //执行上传
                pd.put("PIC2", ffile + "/" + fileName);                //路径
            }
            if (null != file3 && !file3.isEmpty()) {
                isChange = true;
                String filePath = PathUtil.getClasspath() + Const.FILEPATHIMG + ffile;        //文件上传路径
                fileName = FileUpload.fileUp(file3, filePath, this.get32UUID());                //执行上传
                pd.put("PIC3", ffile + "/" + fileName);                //路径
            }
            if (isChange) {
                pd.put("UPDATE_DATE", new Date());

                if(varList != null && varList.size() > 0){
                    homeService.edit(pd);
                }else{
                    pd.put("HOME_ID", this.get32UUID());
                    homeService.save(pd);
                }

            }

        }
        ModelAndView mv = this.getModelAndView();
        mv.setViewName("system/home/home_list");

        mv.addObject("pd", pd);
        return mv;
    }


    /**
     * 删除
     */
    @RequestMapping(value = "/deltp")
    public void deltp(PrintWriter out) {
        logBefore(logger, "删除Home");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "del")) {
            return;
        } //校验权限
        PageData pd = new PageData();
        PageData pdd = new PageData();
        try {
            pd = this.getPageData();
            List<PageData> varList = homeService.listAll(pd);    //列出Home列表
            if(varList != null && varList.size() > 0){
                pdd = varList.get(0);
                pdd.put(pd.getString("PICNUM"),"");
                homeService.edit(pdd);
            }
            out.write("success");
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

    }

    /**
     * 修改
     */
    @RequestMapping(value = "/edit")
    public ModelAndView edit() throws Exception {
        logBefore(logger, "修改Home");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "edit")) {
            return null;
        } //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        homeService.edit(pd);
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 列表
     */
    @RequestMapping(value = "/list")
    public ModelAndView list(Page page) {
        logBefore(logger, "列表Home");
        //if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        try {

            List<PageData> varList = homeService.list(page);    //列出Home列表
            mv.setViewName("system/home/home_list");
            if (varList != null && varList.size() > 0) {
                pd = varList.get(0);
            }
            mv.addObject("pd", pd);
            mv.addObject(Const.SESSION_QX, this.getHC());    //按钮权限
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return mv;
    }

    /**
     * 去新增页面
     */
    @RequestMapping(value = "/goAdd")
    public ModelAndView goAdd() {
        logBefore(logger, "去新增Home页面");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
            mv.setViewName("app/home/home_edit");
            mv.addObject("msg", "save");
            mv.addObject("pd", pd);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return mv;
    }

    /**
     * 去修改页面
     */
    @RequestMapping(value = "/goEdit")
    public ModelAndView goEdit() {
        logBefore(logger, "去修改Home页面");
        ModelAndView mv = this.getModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
            pd = homeService.findById(pd);    //根据ID读取
            mv.setViewName("app/home/home_edit");
            mv.addObject("msg", "edit");
            mv.addObject("pd", pd);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return mv;
    }

    /**
     * 批量删除
     */
    @RequestMapping(value = "/deleteAll")
    @ResponseBody
    public Object deleteAll() {
        logBefore(logger, "批量删除Home");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "dell")) {
            return null;
        } //校验权限
        PageData pd = new PageData();
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            pd = this.getPageData();
            List<PageData> pdList = new ArrayList<PageData>();
            String DATA_IDS = pd.getString("DATA_IDS");
            if (null != DATA_IDS && !"".equals(DATA_IDS)) {
                String ArrayDATA_IDS[] = DATA_IDS.split(",");
                homeService.deleteAll(ArrayDATA_IDS);
                pd.put("msg", "ok");
            } else {
                pd.put("msg", "no");
            }
            pdList.add(pd);
            map.put("list", pdList);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        } finally {
            logAfter(logger);
        }
        return AppUtil.returnObject(pd, map);
    }

    /*
     * 导出到excel
     * @return
     */
    @RequestMapping(value = "/excel")
    public ModelAndView exportExcel() {
        logBefore(logger, "导出Home到excel");
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "cha")) {
            return null;
        }
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        try {
            Map<String, Object> dataMap = new HashMap<String, Object>();
            List<String> titles = new ArrayList<String>();
            titles.add("图片地址");    //1
            titles.add("图片地址");    //2
            titles.add("图片地址");    //3
            titles.add("更新时间");    //4
            dataMap.put("titles", titles);
            List<PageData> varOList = homeService.listAll(pd);
            List<PageData> varList = new ArrayList<PageData>();
            for (int i = 0; i < varOList.size(); i++) {
                PageData vpd = new PageData();
                vpd.put("var1", varOList.get(i).getString("PIC1"));    //1
                vpd.put("var2", varOList.get(i).getString("PIC2"));    //2
                vpd.put("var3", varOList.get(i).getString("PIC3"));    //3
                vpd.put("var4", varOList.get(i).getString("UPDATE_DATE"));    //4
                varList.add(vpd);
            }
            dataMap.put("varList", varList);
            ObjectExcelView erv = new ObjectExcelView();
            mv = new ModelAndView(erv, dataMap);
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
        return mv;
    }

    /* ===============================权限================================== */
    public Map<String, String> getHC() {
        Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
        Session session = currentUser.getSession();
        return (Map<String, String>) session.getAttribute(Const.SESSION_QX);
    }
    /* ===============================权限================================== */

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
    }
}
