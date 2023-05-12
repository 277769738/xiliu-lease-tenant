package com.xiliu.server.modules.system.controller;

import com.xiliu.common.result.R;
import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;

import com.xiliu.server.modules.system.entity.XlDict;
import com.xiliu.server.modules.system.service.IXlDictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * 字典表Controller
 * 
 * @author xiliu
 * @date 2022-08-09
 */
@RestController
@RequestMapping("/system/dict")
public class XlDictController extends BaseController {
    @Autowired
    private IXlDictService xlDictService;

    /**
     * 查询字典表列表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlDict xlDict) {
        startPage();
        List<XlDict> list = xlDictService.selectXlDictList(xlDict);
        return getDataTable(list);
    }


    /**
     * 获取字典表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:query')")
    @GetMapping(value = "/{dictId}")
    public R getInfo(@PathVariable("dictId") Long dictId) {
        return R.ok(xlDictService.selectXlDictByDictId(dictId));
    }

    /**
     * 新增字典表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:create')")
    @Log(title = "字典表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlDict xlDict) {
        boolean success = xlDictService.create(xlDict);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改字典表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:edit')")
    @Log(title = "字典表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{dictId}")
    public R update(@PathVariable Long dictId,  @RequestBody XlDict xlDict) {
        xlDict.setDictId(dictId);
        boolean success = xlDictService.update(xlDict);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除字典表
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:remove')")
    @Log(title = "字典表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{dictIds}")
    public R remove(@PathVariable Long[] dictIds) {
        return R.ok(xlDictService.deleteXlDictByDictIds(dictIds));
    }

    @GetMapping("/optionselect")
    public R optionselect() {
        List<XlDict> list = xlDictService.selectDictTypeAll();
        return R.ok(list);
    }

    /**
     * 刷新字典缓存
     */
    @PreAuthorize("@customSs.hasPermi('system:dict:remove')")
    @Log(title = "字典类型", businessType = BusinessType.CLEAN)
    @DeleteMapping("/refreshCache")
    public R refreshCache() {
        xlDictService.resetDictCache();
        return R.ok();
    }
}
