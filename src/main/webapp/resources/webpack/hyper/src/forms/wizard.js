/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Wizard demo
 */

import 'twitter-bootstrap-wizard/jquery.bootstrap.wizard.min';
import '../core/hyper';

// Wizard
class Wizard {
  constructor() {}

  /**
   * Initlizes
   */
  init() {
    $('#basicwizard').bootstrapWizard();

    $('#progressbarwizard').bootstrapWizard({
      onTabShow: function(tab, navigation, index) {
        var $total = navigation.find('li').length;
        var $current = index + 1;
        var $percent = ($current / $total) * 100;
        $('#progressbarwizard')
          .find('.bar')
          .css({ width: $percent + '%' });
      },
    });

    $('#btnwizard').bootstrapWizard({
      nextSelector: '.button-next',
      previousSelector: '.button-previous',
      firstSelector: '.button-first',
      lastSelector: '.button-last',
    });

    $('#rootwizard').bootstrapWizard({
      onNext: function(tab) {
        var form = $($(tab).data('targetForm'));
        if (form) {
          form.addClass('was-validated');
          if (form[0].checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
            return false;
          }
        }
      },
    });
  }
}

// init Wizard
var wizard = new Wizard();
wizard.init();
