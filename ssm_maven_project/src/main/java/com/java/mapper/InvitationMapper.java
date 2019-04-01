package com.java.mapper;

import com.java.pojo.Invitatiton;
import com.java.pojo.Reply_detail;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface InvitationMapper {
    //查询所有帖子
    @Select ("select * from invitation")
    List<Invitatiton> selectInvitationsList();
    //搜索功能
    @Select ("SELECT * FROM invitation WHERE title LIKE CONCAT('%',#{0},'%') ")
    List<Invitatiton> selectInvitationLikeList(String title);

    //查看信息
    @Select ("SELECT rd.* FROM reply_detail rd INNER JOIN invitation i WHERE i.id=rd.invid AND i.id=#{0}")
    List<Reply_detail> selectReplyList(Integer id);

    //添加回复
    @Insert ("INSERT INTO reply_detail VALUES(null,#{invid},#{content},#{author},#{creatdate})")
    int insertReply(Reply_detail reply_detail);

    //删除评论
    @Delete ("DELETE reply_detail,invitation  FROM reply_detail,invitation WHERE reply_detail.invid=invitation.id AND invitation.id=#{0}")
    int deleteReply(Integer id);
}
