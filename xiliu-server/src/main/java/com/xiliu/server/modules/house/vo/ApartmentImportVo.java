package com.xiliu.server.modules.house.vo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.xiliu.common.annotation.DictFormat;
import com.xiliu.common.constant.DictTypeConstants;
import com.xiliu.server.common.convert.DictConvert;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * @author xiliu
 * @description 公寓 Excel 导入 VO
 * @date 2023/3/23
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = false)
public class ApartmentImportVo {

    @ExcelProperty(value = "类别", converter = DictConvert.class)
    @DictFormat(DictTypeConstants.APARTMENT_TYPE)
    private String apartmentType;

    @ExcelProperty("品牌")
    private String brandName;

    @ExcelProperty("项目")
    private String classifyName;

    @ExcelProperty("公寓名称")
    private String apartmentName;

    @ExcelProperty("省份")
    private String province;

    @ExcelProperty("城市")
    private String city;

    @ExcelProperty("区县")
    private String county;

    @ExcelProperty("详细地址")
    private String detailAddress;

    @ExcelProperty("总楼层")
    private Integer floorNum;

    @ExcelProperty("每层间数")
    private Integer houseNum;

    /** 是否电梯楼 N:否;Y:是 */
    @ExcelProperty(value ="是否电梯楼", converter = DictConvert.class)
    @DictFormat(DictTypeConstants.IS_LIFT_TYPE)
    private String isLift;

    @ExcelProperty("联系人")
    private String contact;

    @ExcelProperty("联系电话")
    private String contactNumber;

}
