package com.mbn.service.implement;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbn.pojo.Comment;
import com.mbn.repository.CommentRepository;
import com.mbn.service.CommentService;

@Service
@Transactional
public class CommentServiceImplement implements CommentService {
	@Autowired
	private CommentRepository commentRepository;

	@Override
	public List<Comment> getComments(int productId) {
		return this.commentRepository.getComments(productId);
	}

	@Override
	public Comment addComment(String content, int productId) {
		return this.commentRepository.addComment(content, productId);
	}
}
