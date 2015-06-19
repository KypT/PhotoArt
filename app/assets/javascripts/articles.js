$(function () {
    var articles = $('.article-scale');

    var scaleArticles = function () {
        if ($(window).width() < 768)
            articles.removeClass('col-xs-10 col-xs-8').addClass('col-xs-12');
        else if ($(window).width() < 1015)
            articles.removeClass('col-xs-8 col-xs-12').addClass('col-xs-10');
        else
            articles.removeClass('col-xs-10 col-xs-12').addClass('col-xs-8');
    };

    var resizeTimer;
    $(window).resize(function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(scaleArticles, 100);
    });

    scaleArticles();
});