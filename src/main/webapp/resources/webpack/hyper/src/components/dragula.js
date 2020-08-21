/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Dragula component
 */

import * as dragula from 'dragula/dist/dragula';

// Dragula
class Dragula {
  constructor() {
    this.body = $('body');
  }

  /**
   * Initilizes the Dragula
   */
  init() {
    $('[data-plugin="dragula"]').each(function() {
      var containersIds = $(this).data('containers');
      var containers = [];
      if (containersIds) {
        for (var i = 0; i < containersIds.length; i++) {
          containers.push($('#' + containersIds[i])[0]);
        }
      } else {
        containers = [$(this)[0]];
      }

      // if handle provided
      var handleClass = $(this).data('handleclass');

      // init dragula
      if (handleClass) {
        dragula(containers, {
          moves: function(el, container, handle) {
            return handle.classList.contains(handleClass);
          },
        });
      } else {
        dragula(containers);
      }
    });
  }
}

export default Dragula;
