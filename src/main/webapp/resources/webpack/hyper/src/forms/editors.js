/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: editor
 */

import 'summernote/dist/summernote-bs4.min';
import 'summernote/dist/summernote-bs4.css';
import SimpleMDE from 'simplemde/dist/simplemde.min';
import 'simplemde/dist/simplemde.min.css';

import '../core/hyper';

// Editors
class Editors {
  constructor() { }

  /**
   * Initilizes the summer note
   */
  initSummernote() {
    $('#summernote-basic').summernote({
      placeholder: 'Write something...',
      height: 230,
      callbacks: {
        // fix broken checkbox on link modal
        onInit: function onInit(e) {
          var editor = $(e.editor);
          editor
            .find('.custom-control-description')
            .addClass('custom-control-label')
            .parent()
            .removeAttr('for');
        },
      },
    });
    // air mode on
    $('#summernote-airmode').summernote({
      airMode: true,
      callbacks: {
        // fix broken checkbox on link modal
        onInit: function onInit(e) {
          var editor = $(e.editor);
          editor
            .find('.custom-control-description')
            .addClass('custom-control-label')
            .parent()
            .removeAttr('for');
        },
      },
    });

    // click to edit
    var edit = function edit() {
      $('#summernote-editmode').summernote({
        focus: true,
        callbacks: {
          // fix broken checkbox on link modal
          onInit: function onInit(e) {
            var editor = $(e.editor);
            editor
              .find('.custom-control-description')
              .addClass('custom-control-label')
              .parent()
              .removeAttr('for');
          },
        },
      });
    };
    var save = function save() {
      $('#summernote-editmode').summernote('code');
      $('#summernote-editmode').summernote('destroy');
    };

    $('#summernote-edit').on('click', function () {
      edit();
      // toggle buttons
      $(this).hide();
      $('#summernote-save').show();
    });
    $('#summernote-save').on('click', function () {
      save();
      // toggle buttons
      $(this).hide();
      $('#summernote-edit').show();
    });
  }

  /**
   * Initilizes the simple mde
   */
  initSimpleMDE() {
    // e.g.
    if ($('#simplemde1').length > 0) {
      new SimpleMDE({
        element: document.getElementById('simplemde1'),
        spellChecker: false,
        autosave: {
          enabled: true,
          unique_id: 'simplemde1',
        },
      });
    }
  }

  /**
   * Initlizes
   */
  init() {
    this.initSummernote();
    this.initSimpleMDE();
  }
}

// init Editors
var editors = new Editors();
editors.init();
