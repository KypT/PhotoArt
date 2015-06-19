//=  require ckeditor/init.js.erb

$(function () {
    var events = $('.event-scale');

    var scaleEvents = function () {
        if ($(window).width() < 768)
            events.removeClass('col-xs-10 col-xs-8').addClass('col-xs-12');
        else if ($(window).width() < 1015)
            events.removeClass('col-xs-8 col-xs-12').addClass('col-xs-10');
        else
            events.removeClass('col-xs-10 col-xs-12').addClass('col-xs-8');
    };

    var resizeTimer;
    $(window).resize(function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(scaleEvents, 100);
    });

    scaleEvents();
});