package com.xiliu.server.modules.platform.controller;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.platform.entity.XlTenant;
import com.xiliu.server.modules.platform.service.IXlTenantService;
import com.xiliu.server.modules.platform.vo.TenantResultVo;
import com.xiliu.server.utils.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;


/**
 * 租户表Controller
 * 
 * @author xiliu
 * @date 2023-03-03
 */
@RestController
@RequestMapping("/platform/tenant")
public class XlTenantController extends BaseController {
    @Autowired
    private IXlTenantService xlTenantService;

    /**
     * 查询租户表列表
     */
    @PreAuthorize("@customSs.hasPermi('platform:tenant:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlTenant xlTenant) {
        startPage();
        List<TenantResultVo> list = xlTenantService.selectXlTenantList(xlTenant);
        return getDataTable(list);
    }

    /**
     * 导出租户表列表
     */
    @PreAuthorize("@customSs.hasPermi('platform:tenant:export')")
    @Log(title = "租户表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, XlTenant xlTenant) {
        List<TenantResultVo> list = xlTenantService.selectXlTenantList(xlTenant);
        ExcelUtils.exportEasyExcel(response,XlTenant.class,list,"租户表数据");
    }

    /**
     * 获取租户表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('platform:tenant:query')")
    @GetMapping(value = "/{tenantId}")
    public R getInfo(@PathVariable("tenantId") Long tenantId) {
        return R.ok(xlTenantService.selectXlTenantByTenantId(tenantId));
    }

    /**
     * 新增租户表
     */
    @PreAuthorize("@customSs.hasPermi('platform:tenant:create')")
    @Log(title = "租户表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlTenant xlTenant) {
        return xlTenantService.addTenant(xlTenant);
    }

    /**
     * 修改租户表
     */
    @PreAuthorize("@customSs.hasPermi('platform:tenant:edit')")
    @Log(title = "租户表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{tenantId}")
    public R update(@PathVariable Long tenantId,  @RequestBody XlTenant xlTenant) {
        return xlTenantService.updateTenant(xlTenant);
    }

    /**
     * 删除租户表
     */
    @PreAuthorize("@customSs.hasPermi('platform:tenant:remove')")
    @Log(title = "租户表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{tenantIds}")
    public R remove(@PathVariable Long[] tenantIds) {
        return R.ok(xlTenantService.deleteXlTenantByTenantIds(tenantIds));
    }
}
