package com.xiliu.server.modules.services.controller;

import com.xiliu.common.annotation.Log;
import com.xiliu.common.controller.BaseController;
import com.xiliu.common.enums.BusinessType;
import com.xiliu.common.page.TableDataInfo;
import com.xiliu.common.result.R;
import com.xiliu.server.modules.services.service.IXlUserProjectService;
import com.xiliu.server.modules.services.service.PostService;
import com.xiliu.server.modules.services.vo.PostResultVo;
import com.xiliu.server.modules.system.entity.XlRole;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author xiliu
 * @description 职务管理
 * @date 2023/3/27
 */
@RestController
@RequestMapping("/services/post")
public class PostController extends BaseController{

    @Resource
    private PostService postService;

    /**
     * 查询职务信息列表
     */
    @PreAuthorize("@customSs.hasPermi('services:post:list')")
    @GetMapping("/list")
    public TableDataInfo list(XlRole xlRole) {
        startPage();
        List<PostResultVo> list = postService.getPostList(xlRole);
        return getDataTable(list);
    }

    @GetMapping("/get-list")
    public R getPostList() {
        return R.ok(postService.getPostMap());
    }

    /**
     * 新增职务信息
     */
    @PreAuthorize("@customSs.hasPermi('services:post:create')")
    @Log(title = "职务管理", businessType = BusinessType.INSERT)
    @PostMapping("/create")
    public R create(@RequestBody PostResultVo vo) {
        return postService.addPost(vo);
    }

    /**
     * 获取详细信息
     */
    @GetMapping(value = "/{postId}")
    public R getInfo(@PathVariable("postId") Long postId) {
        return R.ok(postService.getPostInfo(postId));
    }

    /**
     * 修改职务信息
     */
    @PreAuthorize("@customSs.hasPermi('services:post:edit')")
    @Log(title = "职务管理", businessType = BusinessType.UPDATE)
    @PostMapping(value = "/update/{roleId}")
    public R update(@PathVariable Long roleId,  @RequestBody PostResultVo vo) {
        return postService.updatePost(vo);
    }

    /**
     * 删除职务信息
     */
    @PreAuthorize("@customSs.hasPermi('services:post:remove')")
    @Log(title = "职务管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{roleIds}")
    public R remove(@PathVariable Long[] roleIds) {
        return postService.deletePost(roleIds);
    }


}
