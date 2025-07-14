// Who am I game

// 6  paths


question = document.getElementById("question");
yes = document.getElementById("yes");
no = document.getElementById("no");
result = document.getElementById("result");
restart = document.getElementById("restart");
image = document.getElementById("image");



question.innerHTML = "Do you fly?";

yes.onclick = function() {
    question.innerHTML = "Are you wlid?";
    yes.onclick = function() {
        result.innerHTML = "You are Egle <br><img src='images/egle.jpg' width='200'/>";
        restart.style.display = "block";
    }

    no.onclick = function() {
        result.innerHTML = "You are Parrot <br><img src='images/parrot.jpg' width='200'/> ";
        restart.style.display = "block";
    }
}

no.onclick = function() {
    question.innerHTML = "Do you live under sea?";
    yes.onclick = function() {
        question.innerHTML = "Are you wlid?";

        yes.onclick = function() {
            result.innerHTML = "You are Shark <br><img src='images/sharks.png' width='200'/> ";
            restart.style.display = "block";
        }
        no.onclick = function() {
            result.innerHTML = "You are Dolphin <br><img src='images/dolphin.png' width='200'/>";
            restart.style.display = "block";
        }
    }

    no.onclick = function() {
        question.innerHTML = "Are you wlid?";

        yes.onclick = function() {
            result.innerHTML = "You are lion <br><img src='images/lion.png' width='200'/> ";
            restart.style.display = "block";
        }
        no.onclick = function() {
            result.innerHTML = "You are Cat <br><img src='images/cat.png' width='200'/>";

            restart.style.display = "block";

        }
    }

}
restart.onclick = function () {
    location.reload();
};