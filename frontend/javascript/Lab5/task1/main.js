
var btn = document.querySelector('#btn');

var myWindow;
var moveInterval;

function openWindow() {
    myWindow = window.open("play.html", "myWindow", "width=30,height=20,top=0,left=0");
    myWindow.focus();


    moveInterval = setInterval(() => {
        if (!myWindow.closed) {
            myWindow.moveBy(10, 10);

                var posX = myWindow.screenX;
                var posY = myWindow.screenY;

                var maxX = window.innerWidth - myWindow.outerWidth;
                var maxY = window.innerHeight - myWindow.outerHeight;

                if (posX > maxX || posY > maxY) {
                    myWindow.moveTo(0, 0);
                }
        } else {
            clearInterval(moveInterval);
        }
    }, 60);
}

btn.addEventListener('click', openWindow);
