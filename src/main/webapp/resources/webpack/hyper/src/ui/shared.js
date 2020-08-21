/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Pages Shared module
 */

import Dragula from '../components/dragula';
import Portlet from '../components/portlet';
import '../core/hyper';

// Shared
class Shared {
  constructor() {}

  /**
   * Initlizes
   */
  init() {
    var dr = new Dragula();
    dr.init();

    var portlet = new Portlet();
    portlet.init();
  }
}

// init Shared
var shared = new Shared();
shared.init();
