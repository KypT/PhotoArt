$( function() {
    var sections = $('.section');

    var scaleSections = function () {
        if ($(window).width() < 440)
            sections.removeClass('col-xs-6').addClass('col-sm-6');
        else if ($(window).width() < 930)
            sections.removeClass('col-sm-4 col-xs-6').addClass('col-xs-6');
        else
            sections.removeClass('col-xs-6').addClass('col-sm-4');
    };

    var resizeTimer;
    $(window).resize(function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(scaleSections, 100);
    });

    scaleSections();
});