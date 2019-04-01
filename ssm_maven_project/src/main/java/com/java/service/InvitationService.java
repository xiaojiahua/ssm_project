package com.java.service;

import com.java.pojo.Invitatiton;
import com.java.pojo.Reply_detail;

import java.util.List;

public interface InvitationService {
    //查询所有
    List<Invitatiton> findInvitationsList(Integer pageNum,Integer pageSize);
    //搜索功能
    List<Invitatiton> findInvitationsLikeList(Integer pageNum,Integer pageSize,String title);
    List<Reply_detail> findReplyList(Integer id);
    int addReply(Reply_detail reply_detail);
    int deleteReply(Integer id);
}
