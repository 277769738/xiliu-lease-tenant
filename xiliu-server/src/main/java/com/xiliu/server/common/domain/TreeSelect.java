package com.xiliu.server.common.domain;

import com.fasterxml.jackson.annotation.JsonInclude;

import com.xiliu.server.modules.system.entity.XlDept;
import com.xiliu.server.modules.system.entity.XlMenu;
import lombok.Data;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author
 * @description Treeselect树结构实体类
 * @date 2022/7/4
 */
@Data
public class TreeSelect implements Serializable{

    /** 节点ID */
    private Long id;

    /** 节点名称 */
    private String label;

    /** 子节点 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<TreeSelect> children;

    public TreeSelect(XlMenu menu)
    {
        this.id = menu.getMenuId();
        this.label = menu.getMenuName();
        this.children = menu.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList());
    }

    public TreeSelect(XlDept dept)
    {
        this.id = dept.getDeptId();
        this.label = dept.getDeptName();
        this.children = dept.getChildren().stream().map(TreeSelect::new).collect(Collectors.toList());
    }
}
