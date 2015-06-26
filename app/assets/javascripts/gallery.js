//= require discussion

$(window).load( function() {
    if ($.supersized)
        $.supersized({
            // Functionality
            autoplay         :   0,		// Length between transitions
            transition       :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
            transition_speed : 700,		// Speed of transition
            fit_portrait     :   1,			// Portrait images will not exceed browser height
            fit_landscape	 :   1,

            // Components
            slide_links		 : 'blank',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
            slides 			 : 	window.slides			// Slideshow Images
        });

    $('#thumb-tray').mouseleave(function() {
        setTimeout(function() {
            $('#tray-button').data('toggle', false);
            if ($('#thumb-tray:hover').length == 0)
                $(vars.thumb_tray).stop().animate({bottom : -$(vars.thumb_tray).height(), avoidTransforms : true}, 300 );}, 500);
    })
});

$(function() {
    var albums = $('.album');

    var possibleSizes = 'col-xs-3 col-xs-4 col-xs-6 col-xs-12';

    var scaleAlbums = function () {
        if ($(window).width() < 550)
            albums.removeClass(possibleSizes).addClass('col-xs-12');
        else if ($(window).width() < 768)
            albums.removeClass(possibleSizes).addClass('col-xs-6');
        else if ($(window).width() < 1015)
            albums.removeClass(possibleSizes).addClass('col-xs-4');
        else
            albums.removeClass(possibleSizes).addClass('col-xs-3');
    };

    var resizeTimer;
    $(window).resize(function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(scaleAlbums, 100);
    });

    scaleAlbums();
});