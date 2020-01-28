let filter = document.querySelectorAll("div.filter button.btn");
let send = document.querySelector('button[type="submit"]');


send.addEventListener("click", ajCall);
let data = {
    "kategorie": "",
    "entfernung": "",
    "preis": "",
    "veggietauglich": ""
};
for (let i = 0; i < filter.length; i++) {
    filter[i].addEventListener("click",
        handleFilter
    );
}

function handleFilter(e) {
    e.preventDefault();
    var val = e.target.firstElementChild.value;
    var klasse = e.target.firstElementChild.className;
    var items = document.getElementsByClassName(klasse);
    for (let i = 0; i < items.length; i++) {
        items[i].parentElement.classList.remove("green")
    }
    let btn = e.target;
    if (btn.classList.contains("green")) {
        btn.classList.remove("green")
    } else {
        btn.classList.add("green");
    }
    switch (klasse) {
        case "kategorie":
            data.kategorie = val;
            break;
        case "entfernung":
            data.entfernung = val;
            break;
        case "preis":
            data.preis = val;
            break;
        case "veggietauglich":
            data.veggietauglich = val;
            break;
    }

}

function ajCall(e) {
    fd = new FormData();
    fd.append("kategorie", data.kategorie);
    fd.append("entfernung", data.entfernung);
    fd.append("preis", data.preis);
    fd.append("veggietauglich", data.veggietauglich);
    e.preventDefault();
    let req  = new XMLHttpRequest();
    req.open("POST", "get.php", true);
    req.send(fd);
    req.onreadystatechange = () => {
        if (req.readyState <= 4) {
            document.getElementById("res").innerHTML= req.responseText
        }
    };



}


