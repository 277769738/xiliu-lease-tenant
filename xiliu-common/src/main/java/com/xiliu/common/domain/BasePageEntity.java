package com.xiliu.common.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @author xiliu
 * @description 分页基类
 * @date 2021/9/2
 */
@Data
@Accessors(chain = true)
public class BasePageEntity implements Serializable{

    @TableField(exist = false)
    private int currentPage = 1;

    @TableField(exist = false)
    private int pageSize = 10;
}
