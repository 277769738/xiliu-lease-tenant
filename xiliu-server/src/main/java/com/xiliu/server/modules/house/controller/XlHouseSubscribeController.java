package com.xiliu.server.modules.house.controller;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.entity.XlHouseSubscribe;
import com.xiliu.server.modules.house.service.IXlHouseSubscribeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 房间预订表Controller
 *
 * @author xiliu
 * @date 2023-04-20
 */
@RestController
@RequestMapping("/house/subscribe")
public class XlHouseSubscribeController extends BaseController {
    @Autowired
    private IXlHouseSubscribeService xlHouseSubscribeService;

    /**
     * 查询房间预订表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:subscribe:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlHouseSubscribe xlHouseSubscribe) {
        startPage();
        List<XlHouseSubscribe> list = xlHouseSubscribeService.selectXlHouseSubscribeList(xlHouseSubscribe);
        return getDataTable(list);
    }

    /**
     * 获取房间预订表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:subscribe:query')")
    @GetMapping(value = "/{subscribeId}")
    public R getInfo(@PathVariable("subscribeId") Long subscribeId) {
        return R.ok(xlHouseSubscribeService.selectXlHouseSubscribeBySubscribeId(subscribeId));
    }

    /**
     * 新增房间预订表
     */
    @PreAuthorize("@customSs.hasPermi('house:subscribe:create')")
    @Log(title = "房间预订表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlHouseSubscribe xlHouseSubscribe) {
        boolean success = xlHouseSubscribeService.create(xlHouseSubscribe);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改房间预订表
     */
    @PreAuthorize("@customSs.hasPermi('house:subscribe:edit')")
    @Log(title = "房间预订表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{subscribeId}")
    public R update(@PathVariable Long subscribeId,  @RequestBody XlHouseSubscribe xlHouseSubscribe) {
        xlHouseSubscribe.setSubscribeId(subscribeId);
        boolean success = xlHouseSubscribeService.update(xlHouseSubscribe);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除房间预订表
     */
    @PreAuthorize("@customSs.hasPermi('house:subscribe:remove')")
    @Log(title = "房间预订表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{subscribeIds}")
    public R remove(@PathVariable Long[] subscribeIds) {
        return R.ok(xlHouseSubscribeService.deleteXlHouseSubscribeBySubscribeIds(subscribeIds));
    }
}
