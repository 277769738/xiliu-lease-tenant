package com.xiliu.server.modules.platform.controller;

import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.result.R;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.xiliu.common.annotation.Log;
import com.xiliu.server.modules.platform.vo.SimplePackage;
import com.xiliu.server.utils.ExcelUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.xiliu.server.modules.platform.entity.XlTenantPackage;
import com.xiliu.server.modules.platform.service.IXlTenantPackageService;
import com.xiliu.common.page.TableDataInfo;


/**
 * 租户套餐表Controller
 * 
 * @author xiliu
 * @date 2023-03-03
 */
@RestController
@RequestMapping("/platform/package")
public class XlTenantPackageController extends BaseController {
    @Autowired
    private IXlTenantPackageService xlTenantPackageService;

    /**
     * 查询租户套餐表列表
     */
    @PreAuthorize("@customSs.hasPermi('platform:package:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlTenantPackage xlTenantPackage) {
        startPage();
        List<XlTenantPackage> list = xlTenantPackageService.selectXlTenantPackageList(xlTenantPackage);
        return getDataTable(list);
    }

    /**
     * 导出租户套餐表列表
     */
    @PreAuthorize("@customSs.hasPermi('platform:package:export')")
    @Log(title = "租户套餐表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, XlTenantPackage xlTenantPackage) {
        List<XlTenantPackage> list = xlTenantPackageService.selectXlTenantPackageList(xlTenantPackage);
        ExcelUtils.exportEasyExcel(response,XlTenantPackage.class,list,"租户套餐表数据");
    }

    /**
     * 获取租户套餐表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('platform:package:query')")
    @GetMapping(value = "/{packageId}")
    public R getInfo(@PathVariable("packageId") Long packageId) {
        return R.ok(xlTenantPackageService.selectXlTenantPackageByPackageId(packageId));
    }

    /**
     * 新增租户套餐表
     */
    @PreAuthorize("@customSs.hasPermi('platform:package:create')")
    @Log(title = "租户套餐表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlTenantPackage xlTenantPackage) {
        boolean success = xlTenantPackageService.create(xlTenantPackage);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改租户套餐表
     */
    @PreAuthorize("@customSs.hasPermi('platform:package:edit')")
    @Log(title = "租户套餐表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{packageId}")
    public R update(@PathVariable Long packageId,  @RequestBody XlTenantPackage xlTenantPackage) {
        xlTenantPackage.setPackageId(packageId);
        boolean success = xlTenantPackageService.update(xlTenantPackage);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除租户套餐表
     */
    @PreAuthorize("@customSs.hasPermi('platform:package:remove')")
    @Log(title = "租户套餐表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{packageIds}")
    public R remove(@PathVariable Long[] packageIds) {
        return R.ok(xlTenantPackageService.deleteXlTenantPackageByPackageIds(packageIds));
    }

    /**
     * 查询租户套餐精简列表
     */
    @GetMapping("/get-simple-list")
    public R getSimpleList() {
        List<SimplePackage> list = xlTenantPackageService.getSimpleList();
        return  R.ok(list);
    }
}
