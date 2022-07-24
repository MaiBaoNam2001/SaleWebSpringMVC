function loadAdminProduct(endpoint) {
	fetch(endpoint).then(function(response) {
		return response.json();
	}).then(function(data) {
		console.info(data);
		let msg = "";
		for (let i = 0; i < data.length; i++) {
			/*
			msg += `
			<tr>
				<td><img alt="${data[i].name}" src="${data[i].image}" width="120"></td>
				<td>${data[i].name}</td>
				<td>${data[i].price} VND</td>
				<td>
					<button id="${data[i].id}"class="btn btn-danger">Xóa</button>
				</td>
			</tr>
			`
			*/
			msg += `
			<tr>
				<td><img alt="${data[i].name}" src="https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg" width="120"></td>
				<td>${data[i].name}</td>
				<td>${data[i].price} VND</td>
				<td>
					<button id="${data[i].id}"class="btn btn-danger">Xóa</button>
				</td>
			</tr>
			`
		}
		let productList = document.getElementById("productList");
		productList.innerHTML = msg;
		let spinner = document.getElementById("spinner");
		spinner.style.display = "none";
	});
}