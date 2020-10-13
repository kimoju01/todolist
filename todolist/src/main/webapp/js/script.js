
var doingList = document.querySelector('.doing-list');
var doneList = document.querySelector('.done-list');


loadEventListners();

function loadEventListners() {
    document.addEventListener('change', toggleItem);
    document.addEventListener('click', removeItem); 
    document.addEventListener('click', starItem);   
}

function addNewItem(itemText) {
    var li = document.createElement('li');
    var div = document.createElement('div');
    div.setAttribute('class', 'view');

    var star = document.createElement('input');
    star.setAttribute('class', 'star');
    star.setAttribute('type', 'button');
    star.setAttribute('value', '★');
    // star.setAttribute('checked', 'false');

    var input = document.createElement('input');
    input.setAttribute('class', 'toggle');
    input.setAttribute('type', 'checkbox');

    var label = document.createElement('label');

    var btn = document.createElement('button');
    btn.setAttribute('class', 'destroy');

    li.append(div);
    div.append(star);
    div.append(input);
    div.append(label);
    div.appendChild(btn);

    label.innerText = itemText;

    doingList.appendChild(li);

    inputText.value = "";
    }

function removeItem(e) {
    if(e.target && e.target.className == 'destroy') {
        e.target.parentElement.parentElement.remove();
    }
}

function toggleItem(e) {
    if(e.target && e.target.className == 'toggle') {
        if(e.target.parentElement.parentElement.parentElement == doingList) {
            e.target.previousSibling.remove();
            doneList.appendChild(e.target.parentElement.parentElement);
            e.target.outerHTML = '<input class="toggle" type="checkbox" checked></input>';
           } else if(e.target.parentElement.parentElement.parentElement == doneList) {
            doingList.appendChild(e.target.parentElement.parentElement);
            var star = document.createElement('input');
            star.setAttribute('class', 'star');
            star.setAttribute('type', 'button');
            star.setAttribute('value', '★');
            // star.setAttribute('checked', 'false');
            e.target.parentElement.insertBefore(star, e.target);
            e.target.outerHTML = '<input class="toggle" type="checkbox"></input>';
        }
    }
}

function starItem(e) {
    if(e.target && e.target.className == 'star') {
        if(e.target.checked) {
            e.target.style.color = "rgb(200, 200, 200)";
            e.target.checked = false;
        } else {
            e.target.style.color = "orange";
            doingList.insertBefore(e.target.parentElement.parentElement, doingList.firstChild);
            e.target.checked = true;
        }
    }
}

var inputText = document.querySelector('.new-todo');
inputText.addEventListener('keypress', function(e) {
    if(e.which === 13) {
        var itemText = inputText.value;
        if(!itemText || itemText === "" || itemText === " ") return false;
          
        addNewItem(itemText);
        }
});




