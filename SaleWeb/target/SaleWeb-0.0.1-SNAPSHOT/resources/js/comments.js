function loadComments(endpoint, productId) {
	fetch(endpoint).then(function(response) {
		return response.json();
	}).then(function(data) {
		console.info(data);
		let msg = "";
		for (let comment of data) {
			msg += `<a href="#" class="list-group-item list-group-item-action">${comment.content} - được bình luận bởi ${comment.user.username} - ${moment(comment.createdDate).locale("vi").fromNow()}</a>`;
		}
		let comment = document.getElementById("comment");
		comment.innerHTML = msg;
	})
}
function addComment(endpoint, productId) {
	fetch(endpoint, {
		method: "POST",
		body: JSON.stringify({
			"content": document.getElementById("content").value,
			"productId": productId
		}),
		headers: {
			"Content-Type": "application/json"
		}
	}).then(function(response) {
		return response.json();
	}).then(function(data) {
		console.info(data);
		let firstComment = document.querySelector("#comment a:first-child");
		let newComment = `<a href="#" class="list-group-item list-group-item-action">${data.content} - được bình luận bởi ${data.user.username} - ${moment(data.createdDate).locale("vi").fromNow()}</a>`;
		firstComment.insertAdjacentHTML("beforebegin", newComment);
	})
}