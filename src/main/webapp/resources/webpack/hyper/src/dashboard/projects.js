/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: Projects Dashboard
 */

import * as Chart from 'chart.js';
import 'bootstrap-datepicker';
import '../core/hyper';

// Dashboard
class ProjectDashboard {
  constructor() {
    this.$body = $('body');
    this.charts = [];

    //default config
    Chart.defaults.global.defaultFontColor = '#8391a2';
    Chart.defaults.scale.gridLines.color = '#8391a2';
    // font
    Chart.defaults.global.defaultFontFamily =
      '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,Oxygen-Sans,Ubuntu,Cantarell,"Helvetica Neue",sans-serif';
  }

  /**
   * Renders the responsive chart
   * @param {*} element element
   * @param {*} type type of chart e.g. bar
   * @param {*} data data
   * @param {*} options chart options
   */
  respChart(element, type, data, options) {
    // get selector by context
    var ctx = element.get(0).getContext('2d');

    // make chart width fit with its container
    var chart = null;
    switch (type) {
      case 'Line':
        chart = new Chart(ctx, {
          type: 'line',
          data: data,
          options: options,
        });
        break;
      case 'Doughnut':
        chart = new Chart(ctx, {
          type: 'doughnut',
          data: data,
          options: options,
        });
        break;
      case 'Pie':
        chart = new Chart(ctx, { type: 'pie', data: data, options: options });
        break;
      case 'Bar':
        chart = new Chart(ctx, { type: 'bar', data: data, options: options });
        break;
      case 'Radar':
        chart = new Chart(ctx, {
          type: 'radar',
          data: data,
          options: options,
        });
        break;
      case 'PolarArea':
        chart = new Chart(ctx, {
          data: data,
          type: 'polarArea',
          options: options,
        });
        break;
    }
    return chart;
  }

  /**
   * Initilizes the charts
   */
  initCharts() {
    var charts = [];
    if ($('#task-area-chart').length > 0) {
      var lineChart = {
        labels: [
          'Sprint 1',
          'Sprint 2',
          'Sprint 3',
          'Sprint 4',
          'Sprint 5',
          'Sprint 6',
          'Sprint 7',
          'Sprint 8',
          'Sprint 9',
          'Sprint 10',
          'Sprint 11',
          'Sprint 12',
          'Sprint 13',
          'Sprint 14',
          'Sprint 15',
          'Sprint 16',
          'Sprint 17',
          'Sprint 18',
          'Sprint 19',
          'Sprint 20',
          'Sprint 21',
          'Sprint 22',
          'Sprint 23',
          'Sprint 24',
        ],
        datasets: [
          {
            label: 'This year',
            backgroundColor: 'rgba(114, 124, 245, 0.3)',
            borderColor: '#727cf5',
            data: [
              16,
              44,
              32,
              48,
              72,
              60,
              84,
              64,
              78,
              50,
              68,
              34,
              26,
              44,
              32,
              48,
              72,
              60,
              74,
              52,
              62,
              50,
              32,
              22,
            ],
          },
        ],
      };

      var lineOpts = {
        maintainAspectRatio: false,
        legend: {
          display: false,
        },
        tooltips: {
          intersect: false,
        },
        hover: {
          intersect: true,
        },
        plugins: {
          filler: {
            propagate: false,
          },
        },
        scales: {
          xAxes: [
            {
              reverse: true,
              gridLines: {
                color: 'rgba(0,0,0,0.05)',
              },
            },
          ],
          yAxes: [
            {
              ticks: {
                stepSize: 10,
                display: false,
              },
              min: 10,
              max: 100,
              display: true,
              borderDash: [5, 5],
              gridLines: {
                color: 'rgba(0,0,0,0)',
                fontColor: '#fff',
              },
            },
          ],
        },
      };
      charts.push(
        this.respChart($('#task-area-chart'), 'Line', lineChart, lineOpts)
      );
    }

    if ($('#project-status-chart').length > 0) {
      //donut chart
      var donutChart = {
        labels: ['Completed', 'In-progress', 'Behind'],
        datasets: [
          {
            data: [64, 26, 10],
            backgroundColor: ['#0acf97', '#727cf5', '#fa5c7c'],
            borderColor: 'transparent',
            borderWidth: '3',
          },
        ],
      };
      var donutOpts = {
        maintainAspectRatio: false,
        cutoutPercentage: 80,
        legend: {
          display: false,
        },
      };
      charts.push(
        this.respChart(
          $('#project-status-chart'),
          'Doughnut',
          donutChart,
          donutOpts
        )
      );
    }
    return charts;
  }

  /**
   * Initlizes the dashboard
   */
  init() {
    var $this = this;

    // init charts
    $this.charts = this.initCharts();

    // calendar
    $('#datepicker-inline').datepicker();

    // enable resizing matter
    $(window).on('resize', function() {
      $.each($this.charts, function(index, chart) {
        try {
          chart.destroy();
        } catch (err) {
          console.log(err);
        }
      });
      $this.charts = $this.initCharts();
    });
  }
}

// init the dashboard
var ds = new ProjectDashboard();
ds.init();
