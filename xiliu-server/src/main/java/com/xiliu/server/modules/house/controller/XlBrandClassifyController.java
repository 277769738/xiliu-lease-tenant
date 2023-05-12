package com.xiliu.server.modules.house.controller;

import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.result.R;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.xiliu.common.annotation.Log;
import com.xiliu.server.modules.house.vo.BrandResultVo;
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
import com.xiliu.server.modules.house.entity.XlBrandClassify;
import com.xiliu.server.modules.house.service.IXlBrandClassifyService;
import com.xiliu.common.page.TableDataInfo;


/**
 * 品牌分类表Controller
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@RestController
@RequestMapping("/house/brand")
public class XlBrandClassifyController extends BaseController {
    @Autowired
    private IXlBrandClassifyService xlBrandClassifyService;

    /**
     * 查询品牌分类表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlBrandClassify xlBrandClassify) {
        startPage();
        List<BrandResultVo> list = xlBrandClassifyService.selectBrandList(xlBrandClassify);
        return getDataTable(list);
    }

    /**
     * 导出品牌分类表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:export')")
    @Log(title = "品牌分类表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, XlBrandClassify xlBrandClassify) {
        List<XlBrandClassify> list = xlBrandClassifyService.selectXlBrandClassifyList(xlBrandClassify);
        ExcelUtils.exportEasyExcel(response,XlBrandClassify.class,list,"品牌分类表数据");
    }

    /**
     * 获取品牌分类表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:query')")
    @GetMapping(value = "/{brandId}")
    public R getInfo(@PathVariable("brandId") Long brandId) {
        return R.ok(xlBrandClassifyService.getBrandById(brandId));
    }

    /**
     * 新增品牌分类表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:create')")
    @Log(title = "品牌分类表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlBrandClassify xlBrandClassify) {
        boolean success = xlBrandClassifyService.create(xlBrandClassify);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改品牌分类表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:edit')")
    @Log(title = "品牌分类表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{brandId}")
    public R update(@PathVariable Long brandId,  @RequestBody XlBrandClassify xlBrandClassify) {
        xlBrandClassify.setBrandId(brandId);
        boolean success = xlBrandClassifyService.update(xlBrandClassify);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除品牌分类表
     */
    @PreAuthorize("@customSs.hasPermi('house:brand:remove')")
    @Log(title = "品牌分类表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{brandIds}")
    public R remove(@PathVariable Long[] brandIds) {
        return R.ok(xlBrandClassifyService.deleteXlBrandClassifyByBrandIds(brandIds));
    }
}
