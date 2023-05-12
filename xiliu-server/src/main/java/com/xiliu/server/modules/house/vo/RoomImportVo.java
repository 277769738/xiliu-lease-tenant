package com.xiliu.server.modules.house.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.annotation.write.style.HeadStyle;
import com.alibaba.excel.enums.poi.HorizontalAlignmentEnum;
import com.xiliu.common.annotation.DictFormat;
import com.xiliu.common.constant.DictTypeConstants;
import com.xiliu.server.common.convert.DictConvert;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.apache.poi.ss.usermodel.HorizontalAlignment;

import java.math.BigDecimal;

/**
 * @author xiliu
 * @description 房源 Excel 导入 VO
 * @date 2023/4/6
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = false)
@HeadStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER)//表头样式居中
@ContentStyle(horizontalAlignment = HorizontalAlignmentEnum.CENTER)//内容样式居中
public class RoomImportVo {

    @ExcelProperty(value = {"公寓信息","公寓名称"})
    private String apartmentName;

    @ExcelProperty(value = {"房间信息","所在楼层"})
    private Long floor;

    @ExcelProperty(value = {"房间信息","房间号"})
    private String houseNo;

    @ExcelProperty(value = {"房间信息","室"})
    private Long room;

    @ExcelProperty(value = {"房间信息","厅"})
    private Long hall;

    @ExcelProperty(value = {"房间信息","卫"})
    private Long toilet;

    @ExcelProperty(value = {"房间信息","面积"})
    private BigDecimal area;

    @ExcelProperty(value = {"房间信息","租金"})
    private BigDecimal money;

    @ExcelProperty(value = {"房间信息","押金"})
    private BigDecimal deposit;

    @ExcelProperty(value = {"收费项目","水费"})
    private BigDecimal waterRate;

    @ExcelProperty(value = {"收费项目","电费"})
    private BigDecimal powerRate;

    @ExcelProperty(value = {"收费项目","网费"})
    private BigDecimal networkRate;

    @ExcelProperty(value = {"收费项目","卫生费"})
    private BigDecimal sanitaryRate;

    @ExcelProperty(value = {"收费项目","公共电费分摊"})
    private BigDecimal pubPowerRate;
}
