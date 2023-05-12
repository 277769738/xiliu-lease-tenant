package com.xiliu.server.modules.house.controller;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.entity.XlProjectClassify;
import com.xiliu.server.modules.house.service.IXlProjectClassifyService;
import com.xiliu.server.modules.house.vo.ProjectResultVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 项目分类表Controller
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@RestController
@RequestMapping("/house/project")
public class XlProjectClassifyController extends BaseController {
    @Autowired
    private IXlProjectClassifyService xlProjectClassifyService;

    /**
     * 查询项目分类表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlProjectClassify xlProjectClassify) {
        startPage();
        List<ProjectResultVo> list = xlProjectClassifyService.selectProjectList(xlProjectClassify);
        return getDataTable(list);
    }

    /**
     * 获取项目分类表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:query')")
    @GetMapping(value = "/{classifyId}")
    public R getInfo(@PathVariable("classifyId") Long classifyId) {
        return R.ok(xlProjectClassifyService.getProjectById(classifyId));
    }

    /**
     * 新增项目分类表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:create')")
    @Log(title = "项目分类表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlProjectClassify xlProjectClassify) {
        boolean success = xlProjectClassifyService.create(xlProjectClassify);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改项目分类表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:edit')")
    @Log(title = "项目分类表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{classifyId}")
    public R update(@PathVariable Long classifyId,  @RequestBody XlProjectClassify xlProjectClassify) {
        xlProjectClassify.setClassifyId(classifyId);
        boolean success = xlProjectClassifyService.update(xlProjectClassify);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除项目分类表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:remove')")
    @Log(title = "项目分类表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{classifyIds}")
    public R remove(@PathVariable Long[] classifyIds) {
        return R.ok(xlProjectClassifyService.deleteXlProjectClassifyByClassifyIds(classifyIds));
    }
}
