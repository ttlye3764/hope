/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Pages Shared module
 */

import '../core/hyper';
import Notification from '../components/notification';

// NotificationDemo
class NotificationDemo {
  constructor() {}

  /**
   * Initlizes
   */
  init() {
    $('#toastr-one').on('click', function() {
      Notification.send(
        'Heads up!',
        'This alert needs your attention, but it is not super important.',
        'top-right',
        'rgba(0,0,0,0.2)',
        'info'
      );
    });

    $('#toastr-two').on('click', function() {
      Notification.send(
        'Heads up!',
        'Check below fields please.',
        'top-center',
        'rgba(0,0,0,0.2)',
        'warning'
      );
    });

    $('#toastr-three').on('click', function() {
      Notification.send(
        'Well Done!',
        'You successfully read this important alert message',
        'bottom-right',
        'rgba(0,0,0,0.2)',
        'success'
      );
    });

    $('#toastr-four').on('click', function() {
      Notification.send(
        'Oh snap!',
        'Change a few things up and try submitting again.',
        'bottom-left',
        'rgba(0,0,0,0.2)',
        'error'
      );
    });

    $('#toastr-five').on('click', function() {
      Notification.send(
        'How to contribute?',
        [
          'Fork the repository',
          'Improve/extend the functionality',
          'Create a pull request',
        ],
        'top-right',
        'rgba(0,0,0,0.2)',
        'info'
      );
    });

    $('#toastr-six').on('click', function() {
      Notification.send(
        'Can I add <em>icons</em>?',
        "Yes! check this <a href='https://github.com/kamranahmedse/jquery-toast-plugin/commits/master'>update</a>.",
        'top-right',
        'rgba(0,0,0,0.2)',
        'info',
        false
      );
    });

    $('#toastr-seven').on('click', function() {
      Notification.send(
        '',
        'Set the `hideAfter` property to false and the toast will become sticky.',
        'top-right',
        'rgba(0,0,0,0.2)',
        'success'
      );
    });

    $('#toastr-eight').on('click', function() {
      Notification.send(
        '',
        'Set the `showHideTransition` property to fade|plain|slide to achieve different transitions.',
        'top-right',
        'rgba(0,0,0,0.2)',
        'info',
        3000,
        1,
        'fade'
      );
    });
  }
}

// init NotificationDemo
var notificationDemo = new NotificationDemo();
notificationDemo.init();
