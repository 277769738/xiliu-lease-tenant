package com.xiliu.server.modules.services.service;

import com.xiliu.common.result.R;
import com.xiliu.server.modules.house.entity.XlApartment;
import com.xiliu.server.modules.services.vo.ApartmentResultVo;
import com.xiliu.server.modules.services.vo.PostResultVo;
import com.xiliu.server.modules.system.entity.XlRole;

import java.util.List;
import java.util.Map;

/**
 * @author xiliu
 * @description ${description}
 * @date 2023/3/27
 */
public interface PostService {

    /**
     * 查询职务信息列表
     * @param xlRole 职务信息表
     * @return 职务信息集合
     */
    List<PostResultVo> getPostList(XlRole xlRole);

    /**
     * 新增职务
     * @param vo 职务信息
     * @return 结果
     */
    R addPost(PostResultVo vo);

    /**
     * 修改职务
     * @param vo 职务信息
     * @return 结果
     */
    R updatePost(PostResultVo vo);

    /**
     * 批量删除职务
     * @param roleIds
     * @return boolean
     **/
    R deletePost(Long[] roleIds);

    /**
     * 获取全部部门、职务
     * @param
     * @return map
     **/
    Map<String, Object> getPostMap();

    /**
     * 获取职务信息
     * @param roleId
     * @return postResultVo
     **/
    PostResultVo getPostInfo(Long roleId);
}
