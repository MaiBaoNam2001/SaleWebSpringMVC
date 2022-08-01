function deleteProduct(endpoint, id) {
	let loadSpinner = document.getElementById("loadSpinner" + id);
	loadSpinner.style.display = "block";
	fetch(endpoint, {
		method: "DELETE"
	}).then(function(response) {
		if (response.status == 204) {
			let row = document.getElementById("row" + id);
			row.style.display = "none";
		}
	}).catch(function(error) {
		console.error(error);
	})
}

function loadAdminProduct(endpoint) {
	fetch(endpoint).then(function(response) {
		return response.json();
	}).then(function(data) {
		console.info(data);
		let msg = "";
		for (let i = 0; i < data.length; i++) {
			msg += `
			<tr id="row${data[i].id}">
				<td><img alt="${data[i].name}" src="https://cdn.tgdd.vn/Products/Images/522/238626/ipad-pro-2021-11-inch-silver-600x600.jpg" width="120"></td>
				<td>${data[i].name}</td>
				<td>${data[i].price} VND</td>
				<td>
					<div class="spinner-border text-info d-none" id="loadSpinner${data[i].id}"></div>
					<input type="submit" id="${data[i].id}" class="btn btn-danger" onclick="deleteProduct('${endpoint + "/" + data[i].id}', ${data[i].id})" value="Xóa"/>
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