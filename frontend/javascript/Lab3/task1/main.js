// task1

// Ready, Steady, Go 

var inp = document.getElementById("numberInput");

inp.addEventListener("input", function () {
    
    var value = parseInt(inp.value);

    var c1 = document.getElementById("circle1");
    var c2 = document.getElementById("circle2");
    var c3 = document.getElementById("circle3");

    var status = document.getElementById("statusText");

    if (value == 1) {
        c1.style.backgroundColor = "red";
        c2.style.backgroundColor = "grey";
        c3.style.backgroundColor = "grey";
        status.innerHTML = "Ready";
    }
    else if (value == 2) {
        c1.style.backgroundColor = "grey";
        c2.style.backgroundColor = "yellow";
        c3.style.backgroundColor = "grey";
        status.innerHTML = "Steady";
    }
    else if (value == 3) {
        c1.style.backgroundColor = "grey";
        c2.style.backgroundColor = "grey";
        c3.style.backgroundColor = "green";
        status.innerHTML = "Go";
    }
    else{
        c1.style.backgroundColor = "grey";
        c2.style.backgroundColor = "grey";
        c3.style.backgroundColor = "grey";
    }
})




