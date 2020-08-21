/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: Main Js
 */

import 'bootstrap';

// other imports
import 'metismenu';
import 'jquery-slimscroll';
import 'select2';
import moment from 'moment';
import 'daterangepicker';
import 'jquery-mask-plugin/dist/jquery.mask.min';
import 'bootstrap-timepicker/js/bootstrap-timepicker.min';
import 'bootstrap-timepicker/css/bootstrap-timepicker.min.css';
import 'bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min';
import 'bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.css';
import 'bootstrap-maxlength';

import LeftSideBar from './leftSidebar';
import Topbar from './topbar';
import RightBar from './rightbar';

// style
import '../scss/app.scss';
// in order to have dark theme, import app-dark.scss instead of app.scss
// import '../scss/app-dark.scss';

// in order to have green theme, import app-dark.scss instead of app.scss
// import '../scss/app-green.scss';

import '../scss/icons.scss';

// Layout and theme manager
const LAYOUT_VERTICAL = 'vertical';
const LAYOUT_HORIZONTAL = 'horizontal';
const LAYOUT_DETACHED = 'detached';

const SIDEBAR_THEME_DEFAULT = 'default';
const SIDEBAR_THEME_LIGHT = 'light';
const SIDEBAR_THEME_DARK = 'dark';

const DEFAULT_CONFIG = {
  layout: LAYOUT_VERTICAL,
  sideBarTheme: SIDEBAR_THEME_DEFAULT,
  isBoxed: false,
  isCondensed: false,
  isScrollable: false,
};

class LayoutTheme {
  constructor() {
    this.body = $('body');
    this.window = $(window);
    this.verticalSidebarPH = $('#vertical-sidebar-placeholder');
    this.verticalTopbarPH = $('#vertical-topbar-placeholder');

    this.detachedTopbarPH = $('#detached-topbar-placeholder');
    this.detachedSidebarPH = $('#detached-sidebar-placeholder');

    this.horizontalTopbarPH = $('#horizontal-topbar-placeholder');

    this._partials = {
      VERTICAL_SIDEBAR: './partials/left-sidebar.html',
      VERTICAL_TOPBAR: './partials/topbar.html',
      DETAHCED_TOPBAR: './partials/topbar-dark.html',
      DETAHCED_SIDEBAR: './partials/detached-left-sidebar.html',
      HORIZONTAL_TOPBAR: './partials/horizontal-nav.html',
    };

    this.leftSideBar = new LeftSideBar();
    this.topbar = new Topbar();

    this.currentlyActivatedLayout = LAYOUT_VERTICAL;

    this._config = {};
  }

  /**
   * Reset the menu content
   */
  _resetMenuContent() {
    this.verticalSidebarPH.html('');
    this.verticalTopbarPH.html('');
    this.detachedTopbarPH.html('');
    this.detachedSidebarPH.html('');
    this.horizontalTopbarPH.html('');
  }

  /**
   * Reset the layout
   */
  _resetLayout() {
    this.body.removeAttr('data-layout');
    this.body.removeAttr('data-layout-mode');
  }

  /**
   * Preserves the config
   */
  _saveConfig(newConfig) {
    this._config = { ...this._config, ...newConfig };
    localStorage.setItem('_HYPER_WP_CONFIG_', JSON.stringify(this._config));
  }

  /**
   * Retuns the locally saved settings
   */
  _getStoredConfig() {
    var config = localStorage.getItem('_HYPER_WP_CONFIG_');
    return config ? JSON.parse(config) : DEFAULT_CONFIG;
  }

  /**
   * Apply the given config and sets the layout and theme
   */
  _applyConfig() {
    var self = this;

    // getting the saved config if available
    this._config = this._getStoredConfig();

    self._resetMenuContent();
    self._resetLayout();

    function _applyOther() {
      // refresh the settings
      self._config = self._getStoredConfig();
      // sets the theme
      switch (self._config.theme) {
        case SIDEBAR_THEME_DARK: {
          self.activateSidebarDarkTheme();
          break;
        }
        case SIDEBAR_THEME_LIGHT: {
          self.activateSidebarLightTheme();
          break;
        }
      }

      // sets the boxed
      if (self._config.isBoxed) self.activateBoxed();

      // sets condensed view
      if (self._config.isCondensed) self.activateCondensedSidebar();

      // sets scrollable navbar
      if (self._config.isScrollable) self.activateScrollableSidebar();
    }

    // sets the layout
    switch (self._config.layout) {
      case LAYOUT_VERTICAL: {
        self.activateVertical(_applyOther);
        break;
      }
      case LAYOUT_HORIZONTAL: {
        self.activateHorizontal(_applyOther);
        break;
      }
      case LAYOUT_DETACHED: {
        self.activateDetached(_applyOther);
        break;
      }
      default: {
        self.activateVertical(_applyOther);
        break;
      }
    }
  }

  /**
   * Initilizes the layout
   */
  _adjustLayout() {
    // in case of small size, add class enlarge to have minimal menu
    if (this.window.width() >= 768 && this.window.width() <= 1028) {
      this.activateCondensedSidebar(true);
    } else {
      var config = this._getStoredConfig();
      if (!config.isCondensed)
        this.deactivateCondensedSidebar();
    }
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
   * * Activates the vertical sidebar
   * @param {*} callBack callback optional
   */
  activateVertical(callBack) {
    var self = this;
    // get the layout and load
    self._resetMenuContent();
    self._resetLayout();

    $.when(
      $.get(self._partials['VERTICAL_SIDEBAR'], content => {
        self.verticalSidebarPH.append(content);
      }),
      // get the topbar
      $.get(self._partials['VERTICAL_TOPBAR'], topContent => {
        self.verticalTopbarPH.append(topContent);
      })
    ).then(function() {
      // init the menu
      self.leftSideBar.init();
      self._saveConfig({ layout: LAYOUT_VERTICAL });
      if (callBack) callBack();
    });
  }

  /**
   * Activates the horizontal layout
   * @param {*} callBack
   */
  activateHorizontal(callBack) {
    var self = this;
    self._resetMenuContent();
    self._resetLayout();

    // get the layout and load
    $.get(self._partials['HORIZONTAL_TOPBAR'], content => {
      self.horizontalTopbarPH.append(content);
      self.verticalSidebarPH.html('');
      self.verticalTopbarPH.html('');
      self.body.attr('data-layout', 'topnav');
      self.topbar.initMenu();

      self._saveConfig({
        layout: LAYOUT_HORIZONTAL,
        isBoxed: false,
        isCondensed: false,
        isScrollable: false,
      });
      if (callBack) callBack();
    });
  }

  /**
   * Activates the detached layout
   * @param {*} callBack
   */
  activateDetached(callBack) {
    var self = this;
    self._resetMenuContent();
    self._resetLayout();

    // get the layout and load
    $.when(
      $.get(self._partials['DETAHCED_TOPBAR'], content => {
        self.detachedTopbarPH.append(content);
      }),
      // get the topbar
      $.get(self._partials['DETAHCED_SIDEBAR'], topContent => {
        self.detachedSidebarPH.append(topContent);
      })
    ).then(function() {
      // init the menu
      self.body.attr('data-layout', 'detached');
      self.leftSideBar.initMenu();

      self._saveConfig({
        layout: LAYOUT_DETACHED,
        isBoxed: false
      });

      if (callBack) callBack();
    });
  }

  /**
   * Activate fluid mode
   */
  activateFluid() {
    this._saveConfig({ isBoxed: false });
    if (
      this._config.layout === LAYOUT_VERTICAL ||
      this._config.layout === LAYOUT_HORIZONTAL
    ) {
      this.body.attr('data-layout-mode', 'fluid');
    }
  }

  /**
   * Activate boxed mode
   */
  activateBoxed() {
    this._saveConfig({ isBoxed: true });
    if (
      this._config.layout === LAYOUT_VERTICAL ||
      this._config.layout === LAYOUT_HORIZONTAL
    ) {
      this.body.attr('data-layout-mode', 'boxed');
    }
  }

  /**
   * Activates the condensed side bar
   */
  activateCondensedSidebar(ignoreToSave) {
    if (
      this._config.layout === LAYOUT_VERTICAL ||
      this._config.layout === LAYOUT_DETACHED
    ) {
      if (!ignoreToSave) {
        this._saveConfig({
          isCondensed: true,
          isScrollable: false,
        });
      }
      this.leftSideBar.activateCondensedSidebar();
    }
  }

  /**
   * deactivates the condensed side bar
   */
  deactivateCondensedSidebar() {
    if (
      this._config.layout === LAYOUT_VERTICAL ||
      this._config.layout === LAYOUT_DETACHED
    ) {
      this._saveConfig({ isCondensed: false });
      this.leftSideBar.deactivateCondensedSidebar();
    }
  }

  /**
   * Activates the scrollable sidenar
   */
  activateScrollableSidebar() {
    if (
      this._config.layout === LAYOUT_VERTICAL ||
      this._config.layout === LAYOUT_DETACHED
    ) {
      this._saveConfig({ isScrollable: true, isCondensed: false });
      this.leftSideBar.activateScrollableSidebar();
    }
  }

  /**
   * Deactivates the scrollable sidenar
   */
  deactivateScrollableSidebar() {
    if (
      this._config.layout === LAYOUT_VERTICAL ||
      this._config.layout === LAYOUT_DETACHED
    ) {
      this._saveConfig({ isScrollable: false });
      this.leftSideBar.deactivateScrollableSidebar();
    }
  }

  /**
   * Activates the default theme
   */
  activateSidebarDefaultTheme() {
    this.leftSideBar.activateDefaultTheme();
    this._saveConfig({ theme: SIDEBAR_THEME_DEFAULT });
  }

  /**
   * Activates the light theme
   */
  activateSidebarLightTheme() {
    if (this._config.layout === LAYOUT_VERTICAL) {
      // this._resetLayout();
      this.leftSideBar.activateLightTheme();
      this._saveConfig({ theme: SIDEBAR_THEME_LIGHT });
    }
  }

  /**
   * Activates the dark theme
   */
  activateSidebarDarkTheme() {
    if (this._config.layout === LAYOUT_VERTICAL) {
      // this._resetLayout();
      this.leftSideBar.activateDarkTheme();
      this._saveConfig({ theme: SIDEBAR_THEME_DARK });
    }
  }

  /**
   * Clear out the saved config
   */
  clearSavedConfig() {
    localStorage.removeItem('_HYPER_CONFIG_');
    this._config = DEFAULT_CONFIG;
  }

  /**
   * Gets the config
   */
  getConfig() {
    return this._config;
  }

  /**
   * Reset to default
   */
  reset(callback) {
    this.clearSavedConfig();
    this._resetLayout();
    this._resetMenuContent();
    var self = this;
    this.activateVertical(function() {
      self.deactivateCondensedSidebar();
      self.deactivateScrollableSidebar();
      self.activateSidebarDefaultTheme();
      self.activateFluid();
      callback();
    });
  }

  /**
   * Init
   */
  init() {
    var self = this;

    // initilize the menu
    this._applyConfig();

    // adjust layout based on width
    this._adjustLayout();

    // on window resize, make menu flipped automatically
    this.window.on('resize', function(e) {
      e.preventDefault();
      self._adjustLayout();
      self._resetSidebarScroll();
    });
  }
}

// App
class HyperApp {
  constructor() {
    this._body = $('body');
    this._window = $(window);

    this.wrapperEl = $('#mainwrapper');

    // remove loading
    window.setTimeout(() => {
      window.setTimeout(() => {
        document.body.classList.remove('loading');
      });
    });

    // rightbar
    this.rightBar = new RightBar();

    // layout manager
    this.layoutTheme = new LayoutTheme();
  }

  /**
   * Initlizes the plugins
   */
  initPlugins() {
    // Select2
    $('[data-toggle="select2"]').select2();

    // input mask
    $('[data-toggle="input-mask"]').each(function(idx, obj) {
      var maskFormat = $(obj).data('maskFormat');
      var reverse = $(obj).data('reverse');
      if (reverse != null) $(obj).mask(maskFormat, { reverse: reverse });
      else $(obj).mask(maskFormat);
    });

    // Datetime and date range picker
    var defaultOptions = {
      cancelClass: 'btn-light',
      applyButtonClasses: 'btn-success',
    };

    // date pickers
    $('[data-toggle="date-picker"]').each(function(idx, obj) {
      var objOptions = $.extend({}, defaultOptions, $(obj).data());
      $(obj).daterangepicker(objOptions);
    });

    //date pickers ranges only
    var start = moment().subtract(29, 'days');
    var end = moment();
    var defaultRangeOptions = {
      startDate: start,
      endDate: end,
      ranges: {
        Today: [moment(), moment()],
        Yesterday: [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
        'This Month': [moment().startOf('month'), moment().endOf('month')],
        'Last Month': [
          moment()
            .subtract(1, 'month')
            .startOf('month'),
          moment()
            .subtract(1, 'month')
            .endOf('month'),
        ],
      },
    };

    $('[data-toggle="date-picker-range"]').each(function(idx, obj) {
      var objOptions = $.extend({}, defaultRangeOptions, $(obj).data());
      var target = objOptions['targetDisplay'];
      //rendering
      $(obj).daterangepicker(objOptions, function(start, end) {
        if (target)
          $(target).html(
            start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY')
          );
      });
    });

    // time picker
    defaultOptions = {
      showSeconds: true,
      icons: {
        up: 'mdi mdi-chevron-up',
        down: 'mdi mdi-chevron-down',
      },
    };

    // time picker
    $('[data-toggle="timepicker"]').each(function(idx, obj) {
      var objOptions = $.extend({}, defaultOptions, $(obj).data());
      $(obj).timepicker(objOptions);
    });

    // touchspin
    $('[data-toggle="touchspin"]').each(function(idx, obj) {
      var objOptions = $.extend({}, {}, $(obj).data());
      $(obj).TouchSpin(objOptions);
    });

    // maxlength
    defaultOptions = {
      warningClass: 'badge badge-success',
      limitReachedClass: 'badge badge-danger',
      separator: ' out of ',
      preText: 'You typed ',
      postText: ' chars available.',
      placement: 'bottom',
    };

    // maxlength
    $('[data-toggle="maxlength"]').each(function(idx, obj) {
      var objOptions = $.extend({}, defaultOptions, $(obj).data());
      $(obj).maxlength(objOptions);
    });

    //initializing tooltip
    $.fn.tooltip && $('[data-toggle="tooltip"]').tooltip();

    //initializing popover
    $.fn.popover && $('[data-toggle="popover"]').popover();

    //initializing toast
    $.fn.toast && $('[data-toggle="toast"]').toast();

    //initializing Slimscroll
    $.fn.slimScroll &&
      $('.slimscroll').slimScroll({
        height: 'auto',
        position: 'right',
        size: '5px',
        touchScrollStep: 20,
        color: '#9ea5ab',
      });

    //initializing form validation
    $('.needs-validation').on('submit', function(event) {
      $(this).addClass('was-validated');
      if ($(this)[0].checkValidity() === false) {
        event.preventDefault();
        event.stopPropagation();
        return false;
      }
      return true;
    });
  }

  /**
   * Activate the vertical layout
   */
  activateVerticalLayout(callback) {
    this.layoutTheme.activateVertical(callback);
  }

  /**
   * Activate the horizontal layout
   */
  activateHorizontalLayout(callback) {
    this.layoutTheme.activateHorizontal(callback);
  }

  /**
   * Activate the detached layout
   */
  activateDetachedlLayout(callback) {
    this.layoutTheme.activateDetached(callback);
  }

  /**
   * Activates the default theme
   */
  activateSidebarDefaultTheme() {
    this.layoutTheme.activateSidebarDefaultTheme();
  }

  /**
   * Activates the light theme
   */
  activateSidebarLightTheme() {
    this.layoutTheme.activateSidebarLightTheme();
  }

  /**
   * Activates the dark theme
   */
  activateSidebarDarkTheme() {
    this.layoutTheme.activateSidebarDarkTheme();
  }

  /**
   * Activates the condensed sidebar
   */
  activateCondensedSidebar() {
    this.layoutTheme.activateCondensedSidebar();
  }

  /**
   * Deactivates the condensed sidebar
   */
  deactivateCondensedSidebar() {
    this.layoutTheme.deactivateCondensedSidebar();
  }

  /**
   * Activates the scrollable sidebar
   */
  activateScrollableSidebar() {
    this.layoutTheme.activateScrollableSidebar();
  }

  /**
   * Deactivates the scrollable
   */
  deactivateScrollableSidebar() {
    this.layoutTheme.deactivateScrollableSidebar();
  }

  /**
   * Activates the boxed mode
   */
  activateBoxed() {
    this.layoutTheme.activateBoxed();
  }

  /**
   * Activate the fluid mode
   */
  activateFluid() {
    this.layoutTheme.activateFluid();
  }

  /**
   * clear the saved layout related settings
   */
  clearSavedConfig() {
    this.layoutTheme.clearSavedConfig();
  }

  /**
   * Gets the layout config
   */
  getLayoutConfig() {
    return this.layoutTheme.getConfig();
  }

  /**
   * Reset the layout
   */
  resetLayout(callback) {
    this.layoutTheme.reset(callback);
  }

  /**
   * Initilizes the various things including layout, sidebar, etc
   */
  init() {
    // initilizes the layout
    this.layoutTheme.init();

    // initilizes the right side bar
    this.rightBar.init();
    // showing the sidebar on load if user is visiting the page first time only
    if (window.sessionStorage) {
      var alreadyVisited = sessionStorage.getItem('_HYPER_VISITED_');
      if (!alreadyVisited) {
        this.rightBar.toggleRightSideBar();
        sessionStorage.setItem('_HYPER_VISITED_', true);
      }
    }

    // plugins
    this.initPlugins();

    // Preloader
    this._window.on('load', function() {
      $('#status').fadeOut();
      $('#preloader')
        .delay(350)
        .fadeOut('slow');
    });
  }
}

// init app
window.hyperApp = new HyperApp();
window.hyperApp.init();
