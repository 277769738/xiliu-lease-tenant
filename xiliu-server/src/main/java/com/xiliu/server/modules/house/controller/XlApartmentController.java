package com.xiliu.server.modules.house.controller;

import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.result.R;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import com.xiliu.common.annotation.Log;
import com.xiliu.server.common.enums.DictLabelEnum;
import com.xiliu.server.modules.house.service.IXlBrandClassifyService;
import com.xiliu.server.modules.house.service.IXlProjectClassifyService;
import com.xiliu.server.modules.house.vo.*;
import com.xiliu.server.modules.system.service.IXlDictService;
import com.xiliu.server.utils.ExcelUtils;
import com.xiliu.server.utils.SecurityUtils;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.house.service.IXlApartmentService;
import com.xiliu.common.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;


/**
 * 公寓信息表Controller
 * 
 * @author xiliu
 * @date 2023-03-17
 */
@RestController
@RequestMapping("/house/apartment")
public class XlApartmentController extends BaseController {
    @Autowired
    private IXlApartmentService xlApartmentService;
    @Autowired
    private IXlDictService dictService;
    @Autowired
    private IXlBrandClassifyService brandClassifyService;
    @Autowired
    private IXlProjectClassifyService projectClassifyService;

    /**
     * 查询公寓信息表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:apartment:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlApartment xlApartment) {
        startPage();
        List<ApartmentResultVo> list = xlApartmentService.getApartmentList(xlApartment);
        return getDataTable(list);
    }

    /**
     * 导出公寓信息表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:apartment:export')")
    @Log(title = "公寓信息表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, XlApartment xlApartment) {
        List<XlApartment> list = xlApartmentService.selectXlApartmentList(xlApartment);
        ExcelUtils.exportEasyExcel(response,XlApartment.class,list,"公寓信息表数据");
    }

    /**
     * 获取公寓信息表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:apartment:query')")
    @GetMapping(value = "/{apartmentId}")
    public R getInfo(@PathVariable("apartmentId") Long apartmentId) {
        return R.ok(xlApartmentService.getApartmentInfo(apartmentId));
    }

    /**
     * 新增公寓信息表
     */
    @PreAuthorize("@customSs.hasPermi('house:apartment:create')")
    @Log(title = "公寓信息表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody XlApartment xlApartment) {
        boolean success = xlApartmentService.create(xlApartment);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改公寓信息表
     */
    @PreAuthorize("@customSs.hasPermi('house:apartment:edit')")
    @Log(title = "公寓信息表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{apartmentId}")
    public R update(@PathVariable Long apartmentId,  @RequestBody XlApartment xlApartment) {
        xlApartment.setApartmentId(apartmentId);
        boolean success = xlApartmentService.update(xlApartment);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除公寓信息表
     */
    @PreAuthorize("@customSs.hasPermi('house:apartment:remove')")
    @Log(title = "公寓信息表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{apartmentIds}")
    public R remove(@PathVariable Long[] apartmentIds) {
        return R.ok(xlApartmentService.deleteXlApartmentByApartmentIds(apartmentIds));
    }

    @GetMapping("/get-import-template")
    @ApiOperation(value = "获得导入公寓模板")
    public void importTemplate(HttpServletResponse response) throws IOException {
        // 手动创建导出 demo
        List<ApartmentImportVo> list = Arrays.asList(
                ApartmentImportVo.builder().apartmentType(DictLabelEnum.JZS.getValue()).brandName("测试").classifyName("测试").apartmentName("测试1")
                        .province("广东省").city("广州市").county("海珠区").detailAddress("滨江路").floorNum(1).houseNum(1).isLift(DictLabelEnum.LIFT_Y.getValue()).contact("姚").contactNumber("1371933967").build(),
                ApartmentImportVo.builder().apartmentType(DictLabelEnum.FSS.getValue()).brandName("测试").classifyName("测试").apartmentName("测试2")
                        .province("广东省").city("广州市").county("海珠区").detailAddress("滨江中路").contact("姚").contactNumber("1371933967").build());
        // 先加载一下数据字典
        dictService.loadingDictCache();
        // 输出
        ExcelUtils.write(response, "公寓导入模板.xlsx", "公寓列表", ApartmentImportVo.class, list);
    }

    @ApiOperation(value = "导入公寓")
    @PreAuthorize("@customSs.hasPermi('house:apartment:import')")
    @Log(title = "公寓信息", businessType = BusinessType.IMPORT)
    @PostMapping("/import")
    public R importExcel(@RequestParam("file") MultipartFile file,
                          @RequestParam(value = "updateSupport", required = false, defaultValue = "false") Boolean updateSupport) throws Exception {
        List<ApartmentImportVo> list = ExcelUtils.read(file, ApartmentImportVo.class);
        return R.ok(xlApartmentService.importApartmentList(list, updateSupport));
    }

    @ApiOperation(value = "获取项目列表")
    @GetMapping("/get-project-list")
    public R getUserProject() {
        Map<String, Object> resultMap = new HashMap<>();
        List<BrandResultVo> brandResultVos = brandClassifyService.selectBrandList(null);
        List<ProjectResultVo> projectResultVos = projectClassifyService.getUserProjectList(SecurityUtils.getUserId());
        resultMap.put("brands",brandResultVos);
        resultMap.put("projects",projectResultVos);
        return R.ok(resultMap);
    }

    @ApiOperation(value = "获取用户公寓列表")
    @GetMapping("/get-user-apartment")
    public R getUserApartmentList() {
        List<ApartmentSimpleVo> vos = xlApartmentService.getUserApartmentList(SecurityUtils.getUserId());
        return R.ok(vos);
    }
    @ApiOperation(value = "获取公寓简单信息")
    @GetMapping("/get-simple-info/{apartmentId}")
    public R getUserApartmentInfo(@PathVariable("apartmentId") Long apartmentId) {
        ApartmentSimpleVo vo = xlApartmentService.getUserApartmentInfo(apartmentId);
        return R.ok(vo);
    }
}
