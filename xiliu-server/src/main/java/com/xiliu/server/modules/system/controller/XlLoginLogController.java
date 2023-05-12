package com.xiliu.server.modules.system.controller;


import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.system.entity.XlLoginLog;
import com.xiliu.server.modules.system.service.IXlLoginLogService;
import com.xiliu.server.utils.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * 系统访问日志表Controller
 * 
 * @author xiliu
 * @date 2022-07-25
 */
@RestController
@RequestMapping("/system/loginlog")
public class XlLoginLogController extends BaseController {
    @Autowired
    private IXlLoginLogService xlLoginLogService;

    /**
     * 查询系统访问日志表列表
     */
    @PreAuthorize("@customSs.hasPermi('system:loginlog:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlLoginLog xlLoginLog) {
        startPage();
        List<XlLoginLog> list = xlLoginLogService.selectXlLoginLogList(xlLoginLog);
        return getDataTable(list);
    }

    /**
     * 导出系统访问日志表列表
     */
    @PreAuthorize("@customSs.hasPermi('system:loginlog:export')")
    @Log(title = "登录日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, XlLoginLog xlLoginLog) {
        List<XlLoginLog> list = xlLoginLogService.selectXlLoginLogList(xlLoginLog);
        ExcelUtils.exportEasyExcel(response,XlLoginLog.class,list,"系统访问日志表数据");
    }

    /**
     * 获取系统访问日志表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('system:log:query')")
    @GetMapping(value = "/{loginId}")
    public R getInfo(@PathVariable("loginId") Long loginId) {
        return R.ok(xlLoginLogService.selectXlLoginLogByLoginId(loginId));
    }

    /**
     * 删除系统访问日志表
     */
    @PreAuthorize("@customSs.hasPermi('system:loginlog:remove')")
    @Log(title = "登录日志", businessType = BusinessType.DELETE)
	@DeleteMapping("/{loginIds}")
    public R remove(@PathVariable Long[] loginIds) {
        return R.ok(xlLoginLogService.deleteXlLoginLogByLoginIds(loginIds));
    }

    @PreAuthorize("@customSs.hasPermi('monitor:logininfor:clean')")
    @Log(title = "登录日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    public R clean() {
        xlLoginLogService.cleanLoginlog();
        return R.ok();
    }
}
