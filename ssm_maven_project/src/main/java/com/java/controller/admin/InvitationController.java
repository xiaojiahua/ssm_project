package com.java.controller.admin;

import com.github.pagehelper.PageInfo;
import com.java.pojo.Invitatiton;
import com.java.pojo.Reply_detail;
import com.java.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class InvitationController {
    //查询所有
    @Autowired
    private InvitationService invitationService;
    @RequestMapping("/getInvitationsList")
    public String getInvitationsList(@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "1") Integer pageSize, Model model){
        List<Invitatiton> invitatitonList = invitationService.findInvitationsList (pageNum, pageSize);
        PageInfo<Invitatiton> pageInfo = new PageInfo<> (invitatitonList);
        model.addAttribute ("pageInfo",pageInfo);
        return "/pages/admin/tiezi_list.jsp";
    }
    //搜索功能
    @RequestMapping("/getInvitationsLikeList")
    public String getInvitationsLikeList(@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "1") Integer pageSize, Model model,@RequestParam("title")String title){
        List<Invitatiton> invitatitons = invitationService.findInvitationsLikeList (pageNum,pageSize,title);
        PageInfo<Invitatiton> pageInfo = new PageInfo<> (invitatitons);
        model.addAttribute ("pageInfo",pageInfo);
        return "/pages/admin/tiezi_list.jsp";
    }
    //查看回复
    @RequestMapping("/getReplyList")
     public String getReplyList(@RequestParam("id") Integer id, Model model){
        List<Reply_detail> replyList = invitationService.findReplyList (id);
        model.addAttribute ("replyList",replyList);
        return "/pages/admin/reply.jsp";
    }

    //添加回复
    @RequestMapping("/saveReply")
    public String saveReply(@RequestParam("id")Integer invid, @RequestParam("content")String content, @RequestParam("author")String author){
        Reply_detail reply_detail = new Reply_detail (invid,content,author,new Date ());
        int i= invitationService.addReply (reply_detail);
        return "/admin/getReplyList";
    }
    //删除评论
    @RequestMapping("/removeReply")
    public String removeReply(@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "1")Integer pageSize,@RequestParam("id")Integer id){
        int i = invitationService.deleteReply (id);
        return "/admin/getInvitationsList";
    }
}
