package com.xiliu.server.modules.house.controller;

import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.result.R;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.xiliu.common.annotation.Log;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.xiliu.server.modules.house.entity.XlArea;
import com.xiliu.server.modules.house.service.IXlAreaService;
import com.xiliu.common.page.TableDataInfo;


/**
 * 省市区表Controller
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@RestController
@RequestMapping("/house/area")
public class XlAreaController extends BaseController {
    @Autowired
    private IXlAreaService xlAreaService;

    /**
     * 查询省市区表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:area:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlArea xlArea) {
        startPage();
        List<XlArea> list = xlAreaService.selectXlAreaList(xlArea);
        return getDataTable(list);
    }

    /**
     * 获取省市区表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:area:query')")
    @GetMapping(value = "/{areaId}")
    public R getInfo(@PathVariable("areaId") Long areaId) {
        return R.ok(xlAreaService.selectXlAreaByAreaId(areaId));
    }

    /**
     * 新增省市区表
     */
    @PreAuthorize("@customSs.hasPermi('house:area:create')")
    @Log(title = "省市区表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlArea xlArea) {
        boolean success = xlAreaService.create(xlArea);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改省市区表
     */
    @PreAuthorize("@customSs.hasPermi('house:area:edit')")
    @Log(title = "省市区表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{areaId}")
    public R update(@PathVariable Long areaId,  @RequestBody XlArea xlArea) {
        xlArea.setAreaId(areaId);
        boolean success = xlAreaService.update(xlArea);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除省市区表
     */
    @PreAuthorize("@customSs.hasPermi('house:area:remove')")
    @Log(title = "省市区表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{areaIds}")
    public R remove(@PathVariable Long[] areaIds) {
        return R.ok(xlAreaService.deleteXlAreaByAreaIds(areaIds));
    }

    @ApiOperation(value = "获取省一级行政区化列表")
    @GetMapping(value = "/get-province-list")
    public R getProvinceList() {
        return R.ok(xlAreaService.getAreaListByTypeAndParentId(0,null));
    }

    @ApiOperation(value = "获取市/区县行政区化列表")
    @GetMapping(value = "/get-city-list")
    public R getCityOrCountyList(@RequestParam("type") Integer type,
                                 @RequestParam("name") String name,
                                 @RequestParam("parentName") String parentName) {
        return R.ok(xlAreaService.getAreaListByTypeAndParentName(type,name,parentName));
    }
}
