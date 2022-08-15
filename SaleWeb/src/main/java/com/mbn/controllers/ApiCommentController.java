package com.mbn.controllers;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.mbn.pojo.Comment;
import com.mbn.service.CommentService;

@RestController
@RequestMapping("/api")
public class ApiCommentController {
	@Autowired
	private CommentService commentService;

	@GetMapping("/products/{productId}/comments")
	public ResponseEntity<List<Comment>> getComments(@PathVariable(name = "productId") int productId) {
		return new ResponseEntity<List<Comment>>(this.commentService.getComments(productId), HttpStatus.OK);
	}

	@PostMapping(path = "/products/{productId}/comments", produces = { MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<Comment> addComment(@RequestBody Map<String, String> params) {
		String content = params.get("content");
		int productId = Integer.parseInt(params.get("productId"));
		return new ResponseEntity<Comment>(commentService.addComment(content, productId), HttpStatus.CREATED);
	}
}
