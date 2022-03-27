$(function () {
    window.addEventListener('message', function (event) {
        let message = event.data;
        var message_wrapper = $('#wrap');
        $('<p style="color:rgb(' + message.colors[0] + ',' + message.colors[1] + ',' + message.colors[2] + ')">' + message.text + '</p>')
        .appendTo(message_wrapper)
        .css({ 'margin-top': '-25px' })
        .animate({ 'margin-top': '0px' }, 1000)
        .delay(5000)
        .animate({ 'margin-top': '-25px' }, 1000)
        .queue(function () { $(this).remove(); });
    }, false);
});