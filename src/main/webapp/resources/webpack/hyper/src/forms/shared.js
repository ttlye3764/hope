/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Shared module
 */

import FileUpload from '../components/fileupload';
import '../core/hyper';

// Shared
class Shared {
  constructor() {}

  /**
   * Initlizes
   */
  init() {
    var fileUpload = new FileUpload();
    fileUpload.init();
  }
}

// init Shared
var shared = new Shared();
shared.init();
