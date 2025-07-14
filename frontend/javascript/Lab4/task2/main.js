function square(num) {
  return num * num;
}

function process(arr, func) {
  return arr.map(func);
}

document.getElementById("processBtn").addEventListener("click", function () {
    var input = document.getElementById("userArray").value;
    var resultArea = document.getElementById("result");

    var numArray = input.split(' ').map(function(item) {
        return parseFloat(item.trim());
    });

    if (numArray.some(isNaN)) {
        resultArea.textContent = " Please enter valid numbers ";
        return;
    }

    var result = process(numArray, square);

    resultArea.textContent = result.join(', ');
});
