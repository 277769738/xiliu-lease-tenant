package com.xiliu.server.modules.services.controller;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.services.service.StaffService;
import com.xiliu.server.modules.services.vo.ApartmentResultVo;
import com.xiliu.server.modules.services.vo.StaffDetailResultVo;
import com.xiliu.server.modules.services.vo.StaffQueryVo;
import com.xiliu.server.modules.services.vo.StaffResultVo;
import com.xiliu.server.modules.system.entity.XlUser;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xiliu
 * @description 员工管理
 * @date 2023/3/27
 */
@RestController
@RequestMapping("/services/staff")
public class StaffController extends BaseController{

    @Resource
    private StaffService staffService;

    /**
     * 查询员工信息列表
     */
    @PreAuthorize("@customSs.hasPermi('services:staff:list')")
    @GetMapping("/list")
    public TableDataInfo list(StaffQueryVo queryVo) {
        startPage();
        List<StaffResultVo> list = staffService.getStaffList(queryVo);
        return getDataTable(list);
    }
    /**
     * 新增员工信息
     */
    @PreAuthorize("@customSs.hasPermi('services:staff:create')")
    @Log(title = "员工管理", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody StaffDetailResultVo vo) {
        return staffService.addStaff(vo);
    }

    /**
     * 获取详细信息
     */
    @GetMapping(value = "/{postId}")
    public R getInfo(@PathVariable("postId") Long postId) {
        return R.ok(staffService.getStaffInfo(postId));
    }

    /**
     * 修改员工信息
     */
    @PreAuthorize("@customSs.hasPermi('services:staff:edit')")
    @Log(title = "员工管理", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update")
    public R update(@RequestBody StaffDetailResultVo vo) {
        return staffService.updateStaff(vo);
    }

    /**
     * 删除员工信息
     */
    @PreAuthorize("@customSs.hasPermi('services:staff:remove')")
    @Log(title = "员工管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public R remove(@PathVariable Long[] userIds) {
        return staffService.deleteStaff(userIds);
    }

    /**
     * 查询分配门店列表
     */
    @ApiOperation(value = "查询分配门店列表")
    @PreAuthorize("@customSs.hasPermi('services:staff:list')")
    @GetMapping("/get-apartment-list")
    public TableDataInfo getApartmentList(XlApartment xlApartment) {
        startPage();
        List<ApartmentResultVo> list = staffService.getApartmentList(xlApartment);
        return getDataTable(list);
    }

    @ApiOperation(value = "获取已分配门店")
    @GetMapping("/get-auth-apartment")
    public R getAuthApartment(Long userId) {
        return R.ok(staffService.selectAuthListByUserId(userId));
    }

    @ApiOperation(value = "分配门店")
    @PreAuthorize("@customSs.hasPermi('services:staff:authProject')")
    @PostMapping("/auth-apartment")
    public R authApartment(@RequestBody StaffResultVo vo) {
        boolean success = staffService.authApartment(vo);
        if (success) {
            return R.ok();
        }
        return R.error("分配失败");
    }
}
