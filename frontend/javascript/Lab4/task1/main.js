var studentId = 1;

document.getElementById("add").addEventListener("click", function () {
    var nameInput = document.getElementById("student-name");
    var ageInput = document.getElementById("student-age");
    var nameError = document.getElementById("nameError");
    var ageError = document.getElementById("ageError");
    var tableBody = document.getElementById("student-table").getElementsByTagName('tbody')[0];

    var name = nameInput.value.trim();
    var age = parseInt(ageInput.value);

    // Reset errors
    nameError.textContent = "";
    ageError.textContent = "";

    if (name.length > 3) {
       

        if (!isNaN(age) && age > 18) {
            
            var row = document.createElement("tr");
            row.innerHTML = `
                <td>${studentId}</td>
                <td>${name}</td>
                <td>${age}</td>
                <td><button class="remove">Remove</button></td>
            `;
            
            tableBody.appendChild(row);
            studentId++;

            nameInput.value = "";
            ageInput.value = "";

            var remove = row.querySelector(".remove");
            remove.addEventListener("click", function () {
                tableBody.removeChild(row);
                studentId--;
            });

        } else {
            ageError.textContent = "Age must be greater than 18";
        }

    } else {
        nameError.textContent = "Name must be more than 3 characters";
    }
});