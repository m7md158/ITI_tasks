
// sentenceInput is not defined at main.js

// document.addEventListener("DOMContentLoaded", function () {
//     var sentenceInput = document.getElementById("string");
//     var letterInput = document.getElementById("letter");
//     var output = document.getElementById("output");

//     sentenceInput.addEventListener("input", findCharacter);
//     letterInput.addEventListener("input", findCharacter);

//     function findCharacter() {
//         var sentence = sentenceInput.value;
//         var letter = letterInput.value;

//         var positions = [];

    

//         for (var i = 0; i < sentence.length; i++) {
//             if (sentence[i].toLowerCase() === letter.toLowerCase()) {
//                 positions.push(i);
//             }
//         }

//         output.innerText = `[${positions.join(", ")}]`;
//     }
// });


var sentenceInput = document.getElementById("string");
var letterInput = document.getElementById("letter");
var output = document.getElementById("output");

sentenceInput.addEventListener("input", findCharacter);
letterInput.addEventListener("input", findCharacter);

function findCharacter() {
    var sentence = sentenceInput.value;
    var letter = letterInput.value;

    var positions = [];

    

    for (var i = 0; i < sentence.length; i++) {
        if (sentence[i].toLowerCase() === letter.toLowerCase()) {
            positions.push(i);
        }
    }

    output.innerText = `[${positions.join(", ")}]`

}
