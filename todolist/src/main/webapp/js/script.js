function check() {
	var form = document.writetask;

	if (form.newtask.value == "") {
		alert("할 일을 적어주세요");
		form.newtask.focus();
		return false;
	}

	form.submit();

}

function destroyButtonClick(id, eventNode) {

	var httpRequest = new XMLHttpRequest();
	httpRequest.addEventListener("load", function() {
		if (this.responseText === "success")
			eventNode.parentNode.parentNode.remove();
	});

	httpRequest.open('GET', "./delete?id=" + id);
	httpRequest.send();
}

function starButtonClick(id, sequence, eventNode) {

	var httpRequest = new XMLHttpRequest();
	httpRequest.addEventListener("load", function() {
		if (this.responseText === "success") {
			if (sequence == 1) {
				eventNode.style.color = "rgb(200, 200, 200)";
				sequence = 2;
			} else if (sequence == 2) {
				eventNode.style.color = "orange";
				sequence = 1;
			}
		}
	});

	httpRequest.open('GET', "./sequence?id=" + id + "&sequence=" + sequence);
	httpRequest.send();

}

function toggleButtonChange(id, sequence, eventNode) {

	var httpRequest = new XMLHttpRequest();
	var type = eventNode.id;
	var insertItem = eventNode.parentNode.parentNode;

	httpRequest.addEventListener("load", function() {
		if (this.responseText === "success") {
			if (type == 'DOING') {
				type = "DONE";
				eventNode.previousSibling.previousSibling.remove();
				eventNode.outerHTML = '<input class="toggle" id="${todo.type }" type="checkbox" onchange="toggleButtonChange(${todo.id}, ${todo.type}, this)" checked></input>';
			} else if (type == 'DONE') {
				type = "DOING";

				var star = document.createElement('input');
				star.setAttribute('class', 'star');
				star.setAttribute('type', 'button');
				star.setAttribute('value', '★ ');
				eventNode.parentNode.insertBefore(star,eventNode);
				eventNode.outerHTML = '<input class="toggle" type="checkbox"></input>';
				}
			}

			var list = document.querySelector("ul[id=" + type + "]");
			list.appendChild(insertItem);
		});

	httpRequest.open('GET', "./type?id=" + id + "&type=" + type + "&sequence=" + sequence);
	httpRequest.send();

}
