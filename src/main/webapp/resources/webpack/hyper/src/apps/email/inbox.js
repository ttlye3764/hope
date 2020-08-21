/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Inbox
 */

import * as SimpleMDE from 'simplemde/dist/simplemde.min';
import 'simplemde/dist/simplemde.min.css';

import '../../core/hyper';

// Inbox
class Inbox {
  constructor() {}

  /**
   * Initlizes
   */
  init() {
    // Email Checked
    $('input:checkbox').change(function() {
      if ($(this).is(':checked')) {
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .addClass('mail-selected');
      } else {
        $(this)
          .parent()
          .parent()
          .parent()
          .parent()
          .removeClass('mail-selected');
      }
    });

    // editor
    new SimpleMDE({
      element: document.getElementById('simplemde1'),
      spellChecker: false,
      placeholder: 'Write something..',
      tabSize: 2,
      status: false,
      autosave: {
        enabled: false,
      },
    });
  }
}

// init Inbox
var inbox = new Inbox();
inbox.init();
