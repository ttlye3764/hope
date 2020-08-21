/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: Notification
 */

import 'jquery-toast-plugin/dist/jquery.toast.min';
import 'jquery-toast-plugin/dist/jquery.toast.min.css';

class Notification {
  constructor() {}

  /**
   * Send Notification
   * @param {*} heading heading text
   * @param {*} body body text
   * @param {*} position position e.g top-right, top-left, bottom-left, etc
   * @param {*} loaderBgColor loader background color
   * @param {*} icon icon which needs to be displayed
   * @param {*} hideAfter automatically hide after seconds
   * @param {*} stack
   */
  static send(
    heading,
    body,
    position,
    loaderBgColor,
    icon,
    hideAfter,
    stack,
    showHideTransition
  ) {
    // default
    if (!hideAfter) hideAfter = 3000;
    if (!stack) stack = 1;

    var options = {
      heading: heading,
      text: body,
      position: position,
      loaderBg: loaderBgColor,
      icon: icon,
      hideAfter: hideAfter,
      stack: stack,
    };

    if (showHideTransition) options.showHideTransition = showHideTransition;
    else options.showHideTransition = 'fade';

    $.toast().reset('all');
    $.toast(options);
  }
}

export default Notification;
