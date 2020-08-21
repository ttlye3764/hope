/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: Datatable
 */

import 'datatables.net-bs4/css/dataTables.bootstrap4.min.css';
import 'datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css';
import 'datatables.net-buttons-bs4/css/buttons.bootstrap4.min.css';
import 'datatables.net-select-bs4/css/select.bootstrap4.min.css';

import 'datatables.net/js/jquery.dataTables.min';
import 'datatables.net-bs4/js/dataTables.bootstrap4.min';

import 'datatables.net-responsive/js/dataTables.responsive.min';
import 'datatables.net-responsive-bs4/js/responsive.bootstrap4.min';

import 'datatables.net-buttons/js/dataTables.buttons.min';
import 'datatables.net-buttons-bs4/js/buttons.bootstrap4.min';
import 'datatables.net-buttons/js/buttons.html5.min';
import 'datatables.net-buttons/js/buttons.flash.min';
import 'datatables.net-buttons/js/buttons.print.min';

import 'datatables.net-keytable/js/dataTables.keyTable.min';
import 'datatables.net-select/js/dataTables.select.min';

import '../core/hyper';

class Datatable {
  constructor() {}

  /**
   * Initilizes the table
   */
  init() {
    // Default Datatable
    $('#basic-datatable').DataTable({
      keys: true,
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });

    //Buttons examples
    var table = $('#datatable-buttons').DataTable({
      lengthChange: false,
      buttons: [
        {
          extend: 'copyHtml5',
          attr: {
            title: 'Copy',
            id: 'copyButton',
            class: 'btn btn-secondary btn-sm',
          },
        },
        {
          extend: 'print',
          attr: {
            title: 'Print',
            id: 'printButton',
            class: 'btn btn-secondary btn-sm',
          },
        },
      ],
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });

    // Multi Selection Datatable
    $('#selection-datatable').DataTable({
      select: {
        style: 'multi',
      },
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });

    table
      .buttons()
      .container()
      .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');

    // Alternative Pagination Datatable
    $('#alternative-page-datatable').DataTable({
      pagingType: 'full_numbers',
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });

    // Scroll Vertical Datatable
    $('#scroll-vertical-datatable').DataTable({
      scrollY: '350px',
      scrollCollapse: true,
      paging: false,
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });

    // Scroll Vertical Datatable
    $('#scroll-horizontal-datatable').DataTable({
      scrollX: true,
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });

    // Complex headers with column visibility Datatable
    $('#complex-header-datatable').DataTable({
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
      columnDefs: [
        {
          visible: false,
          targets: -1,
        },
      ],
    });

    // Row created callback Datatable
    $('#row-callback-datatable').DataTable({
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
      createdRow: function(row, data) {
        if (data[5].replace(/[$,]/g, '') * 1 > 150000) {
          $('td', row)
            .eq(5)
            .addClass('text-danger');
        }
      },
    });

    // State Saving Datatable
    $('#state-saving-datatable').DataTable({
      stateSave: true,
      language: {
        paginate: {
          previous: "<i class='mdi mdi-chevron-left'>",
          next: "<i class='mdi mdi-chevron-right'>",
        },
      },
      drawCallback: function() {
        $('.dataTables_paginate > .pagination').addClass('pagination-rounded');
      },
    });
  }
}

// init
var datatable = new Datatable();
datatable.init();
