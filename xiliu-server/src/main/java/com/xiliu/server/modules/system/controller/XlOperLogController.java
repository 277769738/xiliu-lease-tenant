package com.xiliu.server.modules.system.controller;


import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.system.entity.XlOperLog;
import com.xiliu.server.modules.system.service.IXlOperLogService;
import com.xiliu.server.utils.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * 操作日志表Controller
 * 
 * @author xiliu
 * @date 2022-07-22
 */
@RestController
@RequestMapping("/system/operlog")
public class XlOperLogController extends BaseController {

    @Autowired
    private IXlOperLogService xlOperLogService;

    /**
     * 查询操作日志表列表
     */
    @PreAuthorize("@customSs.hasPermi('system:operlog:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlOperLog xlOperLog) {
        startPage();
        List<XlOperLog> list = xlOperLogService.selectXlOperLogList(xlOperLog);
        return getDataTable(list);
    }

    /**
     * 获取操作日志表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('system:operlog:query')")
    @GetMapping(value = "/{operId}")
    public R getInfo(@PathVariable("operId") Long operId) {
        return R.ok(xlOperLogService.selectXlOperLogByOperId(operId));
    }

    /**
     * 新增操作日志表
     */
    @PreAuthorize("@customSs.hasPermi('system:operlog:create')")
    @Log(title = "操作日志表", businessType = BusinessType.INSERT)
    @PostMapping
    public R create(@RequestBody XlOperLog xlOperLog) {
        boolean success = xlOperLogService.create(xlOperLog);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改操作日志表
     */
    @PreAuthorize("@customSs.hasPermi('system:operlog:edit')")
    @Log(title = "操作日志表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{operId}")
    public R update(@PathVariable Long operId,  @RequestBody XlOperLog xlOperLog) {
        xlOperLog.setOperId(operId);
        boolean success = xlOperLogService.updateXlOperLog(xlOperLog);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除操作日志表
     */
    @PreAuthorize("@customSs.hasPermi('system:operlog:remove')")
    @Log(title = "操作日志表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{operIds}")
    public R remove(@PathVariable Long[] operIds) {
        return R.ok(xlOperLogService.deleteXlOperLogByOperIds(operIds));
    }

    /**
     * 导出操作日志表
     */
    @PreAuthorize("@customSs.hasPermi('system:operlog:export')")
    @Log(title = "操作日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, XlOperLog xlOperLog) {
        List<XlOperLog> list = xlOperLogService.selectXlOperLogList(xlOperLog);
        ExcelUtils.exportEasyExcel(response,XlOperLog.class,list,"系统操作日志表数据");
    }
}
