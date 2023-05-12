package com.xiliu.server.modules.house.service;

import com.xiliu.server.modules.house.vo.CentralizeDetailVo;
import com.xiliu.server.modules.house.vo.CentralizeRequestVo;
import com.xiliu.server.modules.house.vo.CentralizeRespVo;

import java.util.List;

/**
 * @author xiliu
 * @description
 * @date 2023/4/18
 */
public interface IXlCentralizeService {

    /**
     * 查询集中式独栋列表
     * @param requestVo 参数
     * @return 列表
     */
    List<CentralizeRespVo> getCentralizeList(CentralizeRequestVo requestVo);

    /**
     * 查询更多信息
     * @param houseId 参数
     * @param state 参数
     * @return 列表
     */
    List<CentralizeDetailVo> getCentralizeDetailInfo(Long houseId, Long state);
}
