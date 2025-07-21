// Task 1: Fetch and Display Users Data (AJAX + JSON)

// --Use XMLHttpRequest to GET data from:

//      https://jsonplaceholder.typicode.com/users

// * Parse the JSON response.

// * Show Name, Email, City, and Company in an HTML table.

// * Update the table dynamically after receiving data.


var xhr = new XMLHttpRequest();

xhr.open('GET', 'https://jsonplaceholder.typicode.com/users');
xhr.send();

xhr.onload = function() {
    if (xhr.status === 200) {
        var users = JSON.parse(xhr.responseText);
        var table = document.getElementById('Table');
        var tbody = table.querySelector('tbody');
        users.forEach(function(user) {
            var row = document.createElement('tr');
            row.innerHTML = '<td>' + user.name + '</td>' +
                                            '<td>' + user.email + '</td>' +
                                            '<td>' + user.address.city + '</td>' +
                                            '<td>' + user.company.name + '</td>';
            tbody.appendChild(row);
        });
    }
    else {
        console.log('Error: ' + xhr.status);
    }
}