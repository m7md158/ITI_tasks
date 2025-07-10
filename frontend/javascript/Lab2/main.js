// Ex: input : [1,2,3,4,5]
// Expected Output : 2,4


function getSecondLargestSmallest(arr) {
    arr.sort(function(a, b) {
        return a - b
    });

    arr1 = [new Set(arr)];

    console.log(arr1);
    return [arr[1], arr[arr.length - 2]];
}

console.log(getSecondLargestSmallest([1, 2 ,2 , 3, 4, 5, 10, 20])); 


// Captalize the first letter of each word
// Ex: input: 'the quick brown fox'
// Expected Output: 'The Quick Brown Fox '


// function Captalize(str){
//     var result = [];
//     words = str.split(" ");
//     words.forEach(function(word) {
//         var capitalized = word.charAt(0).toUpperCase() + word.slice(1);
//         result.push(capitalized);
//     });

//     return result.join(" ");

// }

// console.log(Captalize("the quick brown fox"));



// Palindrome

// function checkPalindrome(){
//     var input = prompt("enter the word");
//     var senstiveCase = confirm("Do you want to consider case sensitivity?");

//     reverse_word = input.split('').reverse().join('');
    
//     if (senstiveCase){
//         if (input === reverse_word){
//             alert(" The string is a palindrome.");
//         }else{
//             alert(" The string is NOT a palindrome.");
//         }

//     }
//     else{
//         if (input.toLowerCase() === reverse_word.toLowerCase()){
//             alert(" The string is a palindrome.");
//         }else{
//             alert(" The string is NOT a palindrome.");
//         }
//     }
// }


// checkPalindrome();




// sum  product  division

// var arr  = [];

// for (var i=0; i<3; i++){
//     var num = Number(prompt("Enter the number"));
//     arr.push(num);
// }

// var sum = arr[0] + arr[1] + arr[2];
// var product = arr[0] * arr[1] * arr[2];
// var division = arr[0] / arr[1] / arr[2];

// document.write(`Sum : ${arr[0]} + ${arr[1]} + ${arr[2]} = ${sum} <br>`);
// document.write(`Product : ${arr[0]} * ${arr[1]} * ${arr[2]} = ${product} <br>`);
// document.write(`Division : ${arr[0]} / ${arr[1]} / ${arr[2]} = ${division} <br>`);






// asending and decending

// var arr = [];

// for (var i=0; i<5; i++){
//     var num = Number(prompt("Enter the number"));
//     arr.push(num);
// }

// document.write("original array : " + arr + "<br>");
// document.write(`Ascending Order : ${arr.sort()} <br>`);
// document.write(`Descending Order : ${arr.sort().reverse()} <br>`);