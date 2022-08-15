package com.mbn.service;

import java.util.List;

import com.mbn.pojo.Comment;

public interface CommentService {
	List<Comment> getComments(int productId);

	Comment addComment(String content, int productId);
}
