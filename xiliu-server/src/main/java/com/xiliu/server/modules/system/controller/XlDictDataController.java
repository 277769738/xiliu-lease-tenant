package com.xiliu.server.modules.system.controller;

import cn.hutool.core.collection.CollectionUtil;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.system.entity.XlDictData;
import com.xiliu.server.modules.system.service.IXlDictDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


/**
 * 字典数据表Controller
 * 
 * @author xiliu
 * @date 2022-08-25
 */
@RestController
@RequestMapping("/system/dict/data")
public class XlDictDataController extends BaseController {
    @Autowired
    private IXlDictDataService xlDictDataService;

    /**
     * 查询字典数据表列表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlDictData xlDictData) {
        startPage();
        List<XlDictData> list = xlDictDataService.selectXlDictDataList(xlDictData);
        return getDataTable(list);
    }


    /**
     * 获取字典数据表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:query')")
    @GetMapping(value = "/{dictDataId}")
    public R getInfo(@PathVariable("dictDataId") Long dictDataId) {
        return R.ok(xlDictDataService.selectXlDictDataByDictDataId(dictDataId));
    }

    /**
     * 新增字典数据表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:create')")
    @Log(title = "字典数据表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlDictData xlDictData) {
        boolean success = xlDictDataService.create(xlDictData);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改字典数据表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:edit')")
    @Log(title = "字典数据表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{dictDataId}")
    public R update(@PathVariable Long dictDataId,  @RequestBody XlDictData xlDictData) {
        xlDictData.setDictDataId(dictDataId);
        boolean success = xlDictDataService.update(xlDictData);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除字典数据表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:remove')")
    @Log(title = "字典数据表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dictDataIds}")
    public R remove(@PathVariable Long[] dictDataIds) {
        return R.ok(xlDictDataService.deleteXlDictDataByDictDataIds(dictDataIds));
    }

    /**
     * 根据字典类型查询字典数据信息
     */
    @GetMapping(value = "/type/{dictType}")
    public R getDictDataByType(@PathVariable String dictType) {
        List<XlDictData> list = xlDictDataService.selectDictDataByType(dictType);
        if (CollectionUtil.isEmpty(list)) {
            list = new ArrayList<>();
        }
        return R.ok(list);
    }
}
