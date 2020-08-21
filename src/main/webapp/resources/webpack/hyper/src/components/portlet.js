/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: Portlet
 */

class Portlet {
  constructor() {
    this.portletIdentifier = '.portlet';
    this.portletCloser = '.portlet a[data-toggle="remove"]';
    this.portletRefresher = '.portlet a[data-toggle="reload"]';
  }

  init() {
    // Panel closest
    var self = this;
    $(document).on('click', this.portletCloser, function(ev) {
      ev.preventDefault();
      var portlet = $(this).closest(self.portletIdentifier);
      var portlet_parent = portlet.parent();
      portlet.remove();
      if (portlet_parent.children().length == 0) {
        portlet_parent.remove();
      }
    });

    // Panel Reload
    $(document).on('click', this.portletRefresher, function(ev) {
      ev.preventDefault();
      var portlet = $(this).closest(self.portletIdentifier);
      // This is just a simulation, nothing is going to be reloaded
      portlet.append(
        '<div class="card-disabled"><div class="card-portlets-loader"></div></div>'
      );
      var pd = portlet.find('.card-disabled');
      setTimeout(function() {
        pd.fadeOut('fast', function() {
          pd.remove();
        });
      }, 500 + 300 * (Math.random() * 5));
    });
  }
}

export default Portlet;
