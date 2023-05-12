package com.xiliu.server.common.convert;

import cn.hutool.core.convert.Convert;
import com.alibaba.excel.converters.Converter;
import com.alibaba.excel.enums.CellDataTypeEnum;
import com.alibaba.excel.metadata.GlobalConfiguration;
import com.alibaba.excel.metadata.data.ReadCellData;
import com.alibaba.excel.metadata.data.WriteCellData;
import com.alibaba.excel.metadata.property.ExcelContentProperty;
import com.xiliu.common.annotation.DictFormat;
import com.xiliu.server.modules.system.entity.XlDictData;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Objects;

import static com.xiliu.server.utils.DictUtils.getDictCache;

/**
 * Excel 数据字典转换器
 *
 * @author
 */
@Slf4j
public class DictConvert implements Converter<Object> {

    @Override
    public Class<?> supportJavaTypeKey() {
        throw new UnsupportedOperationException("暂不支持，也不需要");
    }

    @Override
    public CellDataTypeEnum supportExcelTypeKey() {
        throw new UnsupportedOperationException("暂不支持，也不需要");
    }

    @Override
    public Object convertToJavaData(ReadCellData readCellData, ExcelContentProperty contentProperty,
                                    GlobalConfiguration globalConfiguration) {
        // 使用字典解析
        String type = getType(contentProperty);
        String label = readCellData.getStringValue();
        String value = null;
        List<XlDictData> sysDictDataList =  getDictCache(type);
        if(sysDictDataList.size() !=0){
            XlDictData sysDictData = sysDictDataList.stream().filter(s -> Objects.equals(s.getDictLabel(), label)).findFirst().orElse(null);
            if(sysDictData !=null){
                value = sysDictData.getDictValue();
            }
        }
        if (value == null) {
            log.error("[convertToJavaData][type({}) 解析不掉 label({})]", type, label);
            return null;
        }
        // 将 String 的 value 转换成对应的属性
        Class<?> fieldClazz = contentProperty.getField().getType();
        return Convert.convert(fieldClazz, value);
    }

    @Override
    public WriteCellData<String> convertToExcelData(Object object, ExcelContentProperty contentProperty,
                                                    GlobalConfiguration globalConfiguration) {
        // 空时，返回空
        if (object == null) {
            return new WriteCellData<>("");
        }
        // 使用字典格式化
        String type = getType(contentProperty);
        String value = String.valueOf(object);
        String label = null;
        List<XlDictData> sysDictDataList =  getDictCache(type);
        if(sysDictDataList.size() !=0){
            XlDictData sysDictData = sysDictDataList.stream().filter(s -> Objects.equals(s.getDictValue(), value)).findFirst().orElse(null);
            if(sysDictData !=null){
                label = sysDictData.getDictLabel();
            }
        }
        if (label == null) {
            log.error("[convertToExcelData][type({}) 转换不了 label({})]", type, value);
            return new WriteCellData<>("");
        }
        // 生成 Excel 小表格
        return new WriteCellData<>(label);
    }

    private static String getType(ExcelContentProperty contentProperty) {
        return contentProperty.getField().getAnnotation(DictFormat.class).value();
    }

}
