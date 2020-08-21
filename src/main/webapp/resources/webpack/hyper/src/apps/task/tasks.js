/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Tasks
 */

import Dragula from '../../components/dragula';
import '../../core/hyper';

// Tasks
class Tasks {
  constructor() {}

  /**
   * Initlizes the tasks app
   */
  init() {
    var dr = new Dragula();
    dr.init();
  }
}

// init tasks
var tasks = new Tasks();
tasks.init();
