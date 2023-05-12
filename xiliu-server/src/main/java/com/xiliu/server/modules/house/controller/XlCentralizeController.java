package com.xiliu.server.modules.house.controller;

import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.service.IXlCentralizeService;
import com.xiliu.server.modules.house.vo.CentralizeRequestVo;
import com.xiliu.server.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author xiliu
 * @description 集中式独栋
 * @date 2023/4/18
 */
@RestController
@RequestMapping("/house/centralize")
public class XlCentralizeController {

    @Autowired
    private IXlCentralizeService centralizeService;


    /**
     * 获取房源其他费用详细信息
     */
    @PreAuthorize("@customSs.hasPermi('house:single:list')")
    @GetMapping(value = "/list")
    public R getCentralizeList(CentralizeRequestVo requestVo) {
        requestVo.setUserId(SecurityUtils.getUserId());
        return R.ok(centralizeService.getCentralizeList(requestVo));
    }

    @PreAuthorize("@customSs.hasPermi('house:single:list')")
    @GetMapping(value = "/info")
    public R getCentralizeInfo(Long houseId, Long state) {
        return R.ok(centralizeService.getCentralizeDetailInfo(houseId,state));
    }
}
