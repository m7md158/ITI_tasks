
// fuzz buzz game

var number = document.getElementById("num");
var output = document.getElementById("result");

number.addEventListener("input", function () {

    var num = number.value;
    if(num % 3 == 0 && num % 5 == 0){
        output.innerText = "fuzzbuzz";
    }
    else if(num % 3 == 0){
        output.innerText = "fuzz";
    }
    else if(num % 5 == 0){
        output.innerText = "buzz";
    }
    else{
        output.innerText = "none";
    }

})

