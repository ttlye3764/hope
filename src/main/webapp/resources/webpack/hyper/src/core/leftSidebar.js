// Left Sidebar
class LeftSideBar {
  constructor() {
    this.body = $('body');
    this.window = $(window);
    this.menuContainer = $('.slimscroll-menu');
  }

  /**
   * Resets the sidebar scroll
   */
  _resetSidebarScroll() {
    // sidebar - scroll container
    $('.slimscroll-menu').slimscroll({
      height: 'auto',
      position: 'right',
      size: '5px',
      color: '#9ea5ab',
      wheelStep: 5,
      touchScrollStep: 20,
    });
  }

  /**
   * Reset the theme
   */
  _reset() {
    this.body.removeAttr('data-leftbar-theme');
    // this.body.removeAttr('data-leftbar-compact-mode');
    $('#side-main-logo').attr('src', './public/images/logo.png');
    $('#side-sm-main-logo').attr('src', './public/images/logo_sm.png');
  }

  /**
   * Activates the condensed side bar
   */
  activateCondensedSidebar() {
    this.body.attr('data-leftbar-compact-mode', 'condensed');
  }

  /**
   * Deactivates the condensed side bar
   */
  deactivateCondensedSidebar() {
    this.body.removeAttr('data-leftbar-compact-mode');
  }

  /**
   * Activates the scrollable sidenar
   */
  activateScrollableSidebar() {
    this.body.attr('data-leftbar-compact-mode', 'scrollable');
    var leftMenuContainer = $('#left-side-menu-container');
    leftMenuContainer.slimScroll({ destroy: true });
    leftMenuContainer.removeClass('slimscroll-menu');
    leftMenuContainer.removeAttr('style');
    this._resetSidebarScroll();
  }

  /**
   * Deactivate the scrollable sidebar
   */
  deactivateScrollableSidebar() {
    this.body.removeAttr('data-leftbar-compact-mode');
    $('#left-side-menu-container').addClass('slimscroll-menu');
    $('#side-sm-main-logo').attr('src', './public/images/logo_sm_dark.png');
    this._resetSidebarScroll();
  }

  /**
   * Activates the default theme
   */
  activateDefaultTheme() {
    this._reset();
  }

  /**
   * Activates the light theme
   */
  activateLightTheme() {
    this._reset();
    $('#side-main-logo').attr('src', './public/images/logo-dark.png');
    this.body.attr('data-leftbar-theme', 'light');
  }

  /**
   * Activates the dark theme
   */
  activateDarkTheme() {
    this._reset();
    this.body.attr('data-leftbar-theme', 'dark');
  }

  /**
   * Initilizes the menu
   */
  initMenu() {
    var self = this;

    // resets everything
    this._reset();

    // sidebar - main menu
    $('.side-nav').metisMenu();

    // remove slim scroll if scrollable sidebar
    if (this.body.hasClass('scrollable-layout'))
      $('#left-side-menu-container').removeClass('slimscroll-menu');

    // sidebar - scroll container
    this._resetSidebarScroll();

    // click events
    // Left menu collapse
    $(document).on('click', '.button-menu-mobile', function(e) {
      e.preventDefault();
      self.body.toggleClass('sidebar-enable');

      // if (self.window.width() >= 768) {
      //   self.body.toggleClass('enlarged');
      // } else {
      //   self.body.removeClass('enlarged');
      // }
      // sidebar - scroll container
      self._resetSidebarScroll();
    });

    // activate the menu in left side bar based on url
    $('.side-nav a').each(function() {
      var pageUrl = window.location.href.split(/[?#]/)[0];
      if (this.href == pageUrl) {
        $(this).addClass('active');
        $(this)
          .parent()
          .addClass('mm-active'); // add active to li of the current link
        $(this)
          .parent()
          .parent()
          .addClass('mm-show');
        $(this)
          .parent()
          .parent()
          .prev()
          .addClass('active'); // add active class to an anchor
        $(this)
          .parent()
          .parent()
          .parent()
          .addClass('mm-active');
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .addClass('mm-show'); // add active to li of the current link
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .parent()
          .addClass('mm-active');
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .parent()
          .parent()
          .addClass('mm-show');
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .parent()
          .parent()
          .parent()
          .addClass('mm-active'); // add active to li of the current link
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
  }

  /**
   * Initilizes the menu
   */
  init() {
    this.initMenu();
  }
}

export default LeftSideBar;
