// Left Topbar
class Topbar {
  constructor() {
    this.body = $('body');
    this.window = $(window);
  }

  /**
   * Initilizes the menu
   */
  initMenu() {
    $('.topnav-menu li a').each(function() {
      var pageUrl = window.location.href.split(/[?#]/)[0];
      if (this.href == pageUrl) {
        $(this).addClass('active');
        $(this)
          .parent()
          .parent()
          .addClass('active'); // add active to li of the current link
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .addClass('active');
      }
    });

    //initializing Slimscroll
    $.fn.slimScroll &&
      $('.slimscroll').slimScroll({
        height: 'auto',
        position: 'right',
        size: '5px',
        touchScrollStep: 20,
        color: '#9ea5ab',
      });

    // Topbar - main menu
    $('.navbar-toggle').on('click', function() {
      $(this).toggleClass('open');
      $('#navigation').slideToggle(400);
    });

    $('.dropdown-menu a.dropdown-toggle').on('click', function() {
      if (
        !$(this)
          .next()
          .hasClass('show')
      ) {
        $(this)
          .parents('.dropdown-menu')
          .first()
          .find('.show')
          .removeClass('show');
      }
      var $subMenu = $(this).next('.dropdown-menu');
      $subMenu.toggleClass('show');

      return false;
    });
  }

  /**
   * Initilizes the menu
   */
  init() {
    this.initMenu();
  }
}

export default Topbar;
