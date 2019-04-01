package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.InvitationMapper;
import com.java.pojo.Invitatiton;
import com.java.pojo.Reply_detail;
import com.java.service.InvitationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InvitationServiceImpl implements InvitationService {
    @Autowired
    private InvitationMapper invitationMapper;
    //查询所有
    @Override
    public List<Invitatiton> findInvitationsList(Integer pageNum,Integer pageSize){
        //开始分页
        PageHelper.startPage (pageNum,pageSize);
        return invitationMapper.selectInvitationsList ();
    }
    @Override
    //搜索功能
    public List<Invitatiton> findInvitationsLikeList(Integer pageNum,Integer pageSize,String title){
        PageHelper.startPage (pageNum,pageSize);
        return invitationMapper.selectInvitationLikeList (title);
    }

    @Override
    public List<Reply_detail> findReplyList(Integer id) {
        return invitationMapper.selectReplyList (id);
    }

    @Override
    public int addReply(Reply_detail reply_detail) {
        return invitationMapper.insertReply (reply_detail);
    }

    @Override
    public int deleteReply(Integer id) {
        return invitationMapper.deleteReply (id);
    }
}
