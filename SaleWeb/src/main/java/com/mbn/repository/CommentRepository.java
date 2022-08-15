package com.mbn.repository;

import java.util.List;

import com.mbn.pojo.Comment;

public interface CommentRepository {
	List<Comment> getComments(int productId);

	Comment addComment(String content, int productId);
}
