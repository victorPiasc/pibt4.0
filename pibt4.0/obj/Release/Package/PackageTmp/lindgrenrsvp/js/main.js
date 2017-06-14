$(document).ready(function () {
    $('#nav-mobile').html($('#nav').html());

    $('#nav-toggle span').click(function () {
        if ($('#nav-mobile ul').hasClass('expanded')) {
            $('#nav-mobile ul.expanded').removeClass('expanded').fadeOut(250);
            $(this).removeClass("open");
        } else {
            $('#nav-mobile ul').addClass('expanded').fadeIn(250);
            $(this).addClass('open');
        }
    });
}); 
