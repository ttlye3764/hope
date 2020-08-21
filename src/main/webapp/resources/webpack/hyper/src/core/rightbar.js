// Left RightBar
class RightBar {
  constructor() {
    this.body = $('body');
    this.window = $(window);
  }

  /**
   * Activate the layout
   * @param {*} layout
   */
  _activateLayout(layout) {
    switch (layout) {
      case 'vertical':
        window.hyperApp.activateVerticalLayout(function () {
          $('input[type=radio][name=theme]').prop('disabled', false);
          $('input[type=radio][name=compact]').prop('disabled', false);
          $('input[type=radio][name=width]').prop('disabled', false);
        });
        break;
      case 'horizontal':
        window.hyperApp.activateHorizontalLayout(function () {
          // disable the left bar radios
          $('#default-check').prop('checked', true);
          $('#fixed-check').prop('checked', true);

          $('input[type=radio][name=width]').prop('disabled', false);
          $('input[type=radio][name=theme]').prop('disabled', true);
          $('input[type=radio][name=compact]').prop('disabled', true);
        });
        break;
      case 'detached':
        window.hyperApp.activateDetachedlLayout(function () {
          $('#fluid-check').prop('checked', true);
          $('#default-check').prop('checked', true);
          $('#scrollable-check').prop('checked', true);
          $('input[type=radio][name=compact]').prop('disabled', false);
          $('input[type=radio][name=width]').prop('disabled', true);
          $('input[type=radio][name=theme]').prop('disabled', true);
        });
        break;
    }
  }

  /**
   * Select the option based on saved config
   */
  _selectOptionsFromConfig() {
    const config = window.hyperApp.getLayoutConfig();

    if (config) {
      switch (config.layout) {
        case 'vertical':
          $('#vertical-check').prop('checked', true);
          $('input[type=radio][name=theme]').prop('disabled', false);
          $('input[type=radio][name=compact]').prop('disabled', false);
          $('input[type=radio][name=width]').prop('disabled', false);
          break;
        case 'horizontal':
          $('#horizontal-check').prop('checked', true);
          $('input[type=radio][name=width]').prop('disabled', false);
          $('input[type=radio][name=theme]').prop('disabled', true);
          $('input[type=radio][name=compact]').prop('disabled', true);
          break;
        case 'detached':
          $('#fluid-check').prop('checked', true);
          $('#default-check').prop('checked', true);
          $('#scrollable-check').prop('checked', true);
          $('input[type=radio][name=width]').prop('disabled', true);
          $('input[type=radio][name=theme]').prop('disabled', true);
          $('input[type=radio][name=compact]').prop('disabled', false);
          $('#detached-check').prop('checked', true);
          break;
      }

      switch (config.sideBarTheme) {
        case 'default':
          $('#default-check').prop('checked', true);
          break;
        case 'light':
          $('#light-check').prop('checked', true);
          break;
        case 'dark':
          $('#dark-check').prop('checked', true);
          break;
      }

      if (config.isBoxed) {
        $('#boxed-check').prop('checked', true);
      } else {
        $('#fluid-check').prop('checked', true);
      }
      if (config.isCondensed) $('#condensed-check').prop('checked', true);
      if (config.isScrollable) $('#scrollable-check').prop('checked', true);
      if (!config.isCondensed && !config.isCondensed) $('#fixed-check').prop('checked', true);
    }
  }

  /**
   * Toggles the right sidebar
   */
  toggleRightSideBar() {
    var self = this;
    self.body.toggleClass('right-bar-enabled');
    self._selectOptionsFromConfig();
  }

  /**
   * Initilizes the right side bar
   */
  init() {
    var self = this;

    // right side-bar toggle
    $(document).on('click', '.right-bar-toggle', function () {
      self.toggleRightSideBar();
    });

    $(document).on('click', 'body', function (e) {
      if ($(e.target).closest('.right-bar-toggle, .right-bar').length > 0) {
        return;
      }
      if (
        $(e.target).closest('.left-side-menu, .side-nav').length > 0 ||
        $(e.target).hasClass('button-menu-mobile') ||
        $(e.target).closest('.button-menu-mobile').length > 0
      ) {
        return;
      }
      $('body').removeClass('right-bar-enabled');
      $('body').removeClass('sidebar-enable');
      return;
    });

    // handle radio click
    $('input[type=radio][name=layout]').change(function () {
      self._activateLayout($(this).val());
      $('#fluid-check').prop('checked', true);
      window.hyperApp.activateFluid();
    });

    // width mode
    $('input[type=radio][name=width]').change(function () {
      switch ($(this).val()) {
        case 'fluid':
          window.hyperApp.activateFluid();
          self._activateLayout(
            $('input[type=radio][name=layout]:checked').val()
          );
          break;
        case 'boxed':
          window.hyperApp.activateBoxed();
          break;
      }
    });

    // theme
    $('input[type=radio][name=theme]').change(function () {
      switch ($(this).val()) {
        case 'default':
          window.hyperApp.activateSidebarDefaultTheme();
          break;
        case 'light':
          window.hyperApp.activateSidebarLightTheme();
          break;
        case 'dark':
          window.hyperApp.activateSidebarDarkTheme();
          break;
      }
    });

    // compact
    $('input[type=radio][name=compact]').change(function () {
      switch ($(this).val()) {
        case 'fixed':
          window.hyperApp.deactivateCondensedSidebar();
          window.hyperApp.deactivateScrollableSidebar();
          break;
        case 'scrollable':
          window.hyperApp.activateScrollableSidebar();
          break;
        case 'condensed':
          window.hyperApp.activateCondensedSidebar();
          break;
      }
    });

    // reset
    $('#resetBtn').on('click', function (e) {
      e.preventDefault();
      // reset to default
      window.hyperApp.resetLayout(function () {
        self._selectOptionsFromConfig();
      });
    });
  }
}

export default RightBar;
