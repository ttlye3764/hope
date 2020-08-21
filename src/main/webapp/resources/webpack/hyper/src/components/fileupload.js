/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: File upload component
 */

import Dropzone from 'dropzone';

// FileUpload
class FileUpload {
  constructor() {
    this.body = $('body');
  }

  /**
   * Initilizes
   */
  init() {
    // Disable auto discovery
    Dropzone.autoDiscover = false;
    $('[data-plugin="dropzone"]').each(function() {
      var actionUrl = $(this).attr('action');
      var previewContainer = $(this).data('previewsContainer');

      var opts = { url: actionUrl };
      if (previewContainer) {
        opts['previewsContainer'] = previewContainer;
      }

      var uploadPreviewTemplate = $(this).data('uploadPreviewTemplate');
      if (uploadPreviewTemplate) {
        opts['previewTemplate'] = $(uploadPreviewTemplate).html();
      }

      $(this).dropzone(opts);
    });
  }
}

export default FileUpload;
