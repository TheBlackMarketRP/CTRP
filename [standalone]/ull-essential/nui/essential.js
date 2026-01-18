// Written by UnLuckyLust ( © Dreams Weaver 2023 ) | Purchase only at https://UnLuckyLust.tebex.io

// Utils
const sleep = (ms, fn) => {return setTimeout(fn, ms)};
const range = (start, end, length = end - start + 1) => {
    return Array.from({length}, (_, i) => start + i)
};
const random = (min, max) => {
    return Math.floor(Math.random() * (max - min)) + min;
};
const shuffle = (arr) => {
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        const temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
};

$(document).ready(function() {
    const body = document.querySelector('body');
// Notify
    window.addEventListener('message', function (event) {
        switch(event.data.action) {
            default:
                Notify(event.data);
                break;  
        }
    });
    function Notify(data) {
        var $notification = $('.notification.template').clone();
        $notification.removeClass('template');
        $notification.addClass('notify_template-' + data.type);
        $notification.html(data.text);
        $notification.fadeIn();
        $('.notify_container').append($notification);
        setTimeout(function() {
            $.when($notification.fadeOut()).done(function() {
                $notification.remove()
            });
        }, data.length === undefined ? data.length : 5000);
    };
});