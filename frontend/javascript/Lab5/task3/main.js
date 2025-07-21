// Task 2: Cookies — Save, Read, Delete
// Build a page with input to enter username.

// * Save username in a cookie for 7 days.

// * Show a welcome message with username if cookie exists, otherwise show "Guest".

// * Add button to delete the cookie.


function setCookie(name, value, days) {
    var d = new Date();
    d.setTime(d.getTime() + (days * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = name + "=" + value + ";" + expires + ";path=/";
}

function getCookie(name) {
    var cname = name + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for (let i = 0; i < ca.length; i++) {
        let c = ca[i].trim();
        if (c.indexOf(cname) === 0) {
            return c.substring(cname.length, c.length);
        }
    }
    return "";
}

function deleteCookie(name) {
    document.cookie = name + "=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
}

// --- Functional Logic ---
function saveUsername() {
    var name = document.getElementById("username").value;
    if (name) {
        setCookie("username", name, 7);
        updateWelcomeMessage();
    }
}

function deleteUsername() {
    deleteCookie("username");
    updateWelcomeMessage();
}

function updateWelcomeMessage() {
    var user = getCookie("username");
    var message = user ? `Welcome, ${user}!` : "Welcome, Guest!";
    document.getElementById("welcome").textContent = message;
}

// Run on page load
updateWelcomeMessage();
