/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Customers
 */

import 'datatables.net/js/jquery.dataTables.min';
import 'datatables.net-bs4/js/dataTables.bootstrap4.min';
import 'datatables.net-bs4/css/dataTables.bootstrap4.min.css';
import 'datatables.net-responsive/js/dataTables.responsive.min';
import 'datatables.net-responsive-bs4/js/responsive.bootstrap4.min';
import 'datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css';
import 'jquery-datatables-checkboxes/js/dataTables.checkboxes.min';

import '../../core/hyper';

// Customers
class Customers {
  constructor() {}

  /**
   * Initlizes the Customers app
   */
  init() {
    // Default Datatable
    $('#products-datatable').DataTable({
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
        info: 'Showing customers _START_ to _END_ of _TOTAL_',
        lengthMenu:
          "Display <select class='custom-select custom-select-sm ml-1 mr-1'>" +
          '<option value="10">10</option>' +
          '<option value="20">20</option>' +
          '<option value="-1">All</option>' +
          '</select> customers',
      },
      pageLength: 10,
      columns: [
        {
          orderable: false,
          render: function(data, type) {
            if (type === 'display') {
              data =
                '<div class="custom-control custom-checkbox"><input type="checkbox" class="custom-control-input dt-checkboxes"><label class="custom-control-label">&nbsp;</label></div>';
            }
            return data;
          },
          checkboxes: {
            selectRow: true,
            selectAllRender:
              '<div class="custom-control custom-checkbox"><input type="checkbox" class="custom-control-input dt-checkboxes"><label class="custom-control-label">&nbsp;</label></div>',
          },
        },
        { orderable: true },
        { orderable: true },
        { orderable: true },
        { orderable: true },
        { orderable: true },
        { orderable: true },
        { orderable: false },
      ],
      select: {
        style: 'multi',
      },
      order: [[5, 'asc']],
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });
  }
}

var customers = new Customers();
customers.init();
