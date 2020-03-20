const elems = document.querySelectorAll('section');
const bg = document.querySelector('.background');
const monkey = document.querySelector('.monkey');


setTimeout(function () {
    elems.forEach(function (elem, index) {
        elem.style.animation = "none";
    });
}, 1500);



document.body.addEventListener('mousemove', function (e) {
    if (!e.currentTarget.dataset.triggered) {
        elems.forEach(function (elem, index) {
            if (elem.getAttribute('style')) {
                elem.style.transition = "all .5s";
                elem.style.transform = "none";
            }
        });
    }
    e.currentTarget.dataset.triggered = true;
    
    let width = window.innerWidth / 2;
    let mouseMoved1 = ((width - e.pageX) / 40);
    let mouseMoved2 = ((width - e.pageX) / 50);
    let height = window.innerHeight / 2;
    let mouseMoved3 = ((height - e.pageY) / 40);
    let mouseMoved4 = ((height - e.pageY) / 50);


    bg.style.transform = "translateX(" + mouseMoved1 + "px) translateY(" + mouseMoved3 + "px)";
    monkey.style.transform = "translateX(" + mouseMoved2 + "px) translateY(" + mouseMoved4 + "px)";
    
});

document.body.addEventListener('mouseleave', function (e) {
    elems.forEach(function (elem, index) {
        elem.style.transition = "all .5s";
        elem.style.transform = "none";
    });
});

document.body.addEventListener('mouseenter', function (e) {
    elems.forEach(function (elem, index) {
        setTimeout(function () {
            elem.style.transition = "none";
        }, 500);
    });
});