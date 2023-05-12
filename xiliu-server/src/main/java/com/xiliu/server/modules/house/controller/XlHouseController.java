package com.xiliu.server.modules.house.controller;

import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.alibaba.excel.util.IoUtils;
import com.alibaba.fastjson2.JSONArray;
import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.entity.XlHouse;
import com.xiliu.server.modules.house.service.IXlHouseFeeService;
import com.xiliu.server.modules.house.service.IXlHouseService;
import com.xiliu.server.modules.house.vo.RoomImportVo;
import com.xiliu.server.modules.house.vo.RoomListRespVo;
import com.xiliu.server.modules.house.vo.RoomRequestVo;
import com.xiliu.server.utils.ExcelUtils;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static com.xiliu.server.utils.DynamicEasyExcelImportUtils.parseExcelToView;

/**
 * 房源表Controller
 *
 * @author xiliu
 * @date 2023-04-04
 */
@RestController
@RequestMapping("/house/room")
public class XlHouseController extends BaseController {
    @Autowired
    private IXlHouseService xlHouseService;
    @Autowired
    private IXlHouseFeeService houseFeeService;

    /**
     * 查询房源表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:room:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlHouse xlHouse) {
        startPage();
        List<RoomListRespVo> list = xlHouseService.getRoomList(xlHouse);
        return getDataTable(list);
    }

    /**
     * 导出房源表列表
     */
    @PreAuthorize("@customSs.hasPermi('house:room:export')")
    @Log(title = "房源表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, XlHouse xlHouse) {
        List<XlHouse> list = xlHouseService.selectXlHouseList(xlHouse);
        ExcelUtils.exportEasyExcel(response,XlHouse.class,list,"房源表数据");
    }

    /**
     * 获取房源表详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:room:query')")
    @GetMapping(value = "/{houseId}")
    public R getInfo(@PathVariable("houseId") Long houseId) {
        return R.ok(xlHouseService.getRoomDetail(houseId));
    }

    /**
     * 新增房源表
     */
    @PreAuthorize("@customSs.hasPermi('house:room:create')")
    @Log(title = "房源表", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody RoomRequestVo roomRequestVo) {
        boolean success = xlHouseService.create(roomRequestVo);
        if (success) {
            return R.ok();
        }
        return R.error("添加失败");
    }

    /**
     * 修改房源表
     */
    @PreAuthorize("@customSs.hasPermi('house:room:edit')")
    @Log(title = "房源表", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{houseId}")
    public R update(@PathVariable Long houseId,  @RequestBody XlHouse xlHouse) {
        xlHouse.setHouseId(houseId);
        boolean success = xlHouseService.update(xlHouse);
        if (success) {
            return R.ok();
        }
        return R.error("修改失败");
    }

    /**
     * 删除房源表
     */
    @PreAuthorize("@customSs.hasPermi('house:room:remove')")
    @Log(title = "房源表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{houseIds}")
    public R remove(@PathVariable Long[] houseIds) {
        return R.ok(xlHouseService.deleteXlHouseByHouseIds(houseIds));
    }

    @GetMapping("/get-import-template")
    @ApiOperation(value = "获得导入房源模板")
    public void importTemplate(HttpServletResponse response) throws IOException {
        // 手动创建导出 demo
        List<RoomImportVo> list = Arrays.asList(
                RoomImportVo.builder().apartmentName("XX-1店").floor(1L).houseNo("101").room(1L).hall(0L).toilet(1L).area(new BigDecimal("50")).money(new BigDecimal("2000")).deposit(new BigDecimal("4000"))
                        .waterRate(new BigDecimal("5")).powerRate(new BigDecimal("1.5")).networkRate(new BigDecimal("30")).sanitaryRate(new BigDecimal("20")).pubPowerRate(new BigDecimal("10")).build(),
                RoomImportVo.builder().apartmentName("XX-1店").floor(1L).houseNo("102").room(1L).hall(0L).toilet(1L).area(new BigDecimal("50")).money(new BigDecimal("1800")).deposit(new BigDecimal("4000"))
                        .waterRate(new BigDecimal("5")).powerRate(new BigDecimal("1.5")).networkRate(new BigDecimal("30")).sanitaryRate(new BigDecimal("20")).pubPowerRate(new BigDecimal("10")).build(),
                RoomImportVo.builder().apartmentName("XX-2店").floor(1L).houseNo("101").room(1L).hall(0L).toilet(1L).area(new BigDecimal("50")).money(new BigDecimal("1500")).deposit(new BigDecimal("4000"))
                        .waterRate(new BigDecimal("5")).powerRate(new BigDecimal("1.5")).networkRate(new BigDecimal("30")).sanitaryRate(new BigDecimal("20")).pubPowerRate(new BigDecimal("10")).build());
        // 输出
        ExcelUtils.write(response, "房源导入模板.xlsx", "房源列表", RoomImportVo.class, list);
    }

    @ApiOperation(value = "导入房源")
    @PreAuthorize("@customSs.hasPermi('house:room:import')")
    @Log(title = "房源信息", businessType = BusinessType.IMPORT)
    @PostMapping("/import")
    public R importExcel(@RequestParam("file") MultipartFile file,
                         @RequestParam(value = "updateSupport", required = false, defaultValue = "false") Boolean updateSupport) throws Exception {
        byte[] stream = IoUtils.toByteArray(file.getInputStream());
        List<Map<String,String>> dataList = parseExcelToView(stream, 2);
       return R.ok(xlHouseService.importRoomList(dataList,updateSupport));
    }

    /**
     * 获取房源其他费用详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:room:query')")
    @GetMapping(value = "/fee/{houseId}")
    public R getHouseFeeInfo(@PathVariable("houseId") Long houseId) {
        return R.ok(houseFeeService.getHouseFeeInfo(houseId));
    }

}
