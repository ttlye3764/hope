/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Projects
 */

import * as Chart from 'chart.js';
import '../../core/hyper';

// Project
class Project {
  constructor() {
    this.body = $('body');
    this.charts = [];

    // chartjs default styles
    var draw = Chart.controllers.line.prototype.draw;
    Chart.controllers.line.prototype.draw = function() {
      draw.apply(this, arguments);
      var ctx = this.chart.chart.ctx;
      var _stroke = ctx.stroke;
      ctx.stroke = function() {
        ctx.save();
        ctx.shadowColor = 'rgba(0,0,0,0.01)';
        ctx.shadowBlur = 20;
        ctx.shadowOffsetX = 0;
        ctx.shadowOffsetY = 5;
        _stroke.apply(this, arguments);
        ctx.restore();
      };
    };

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
    if ($('#line-chart-example').length > 0) {
      var lineChart = {
        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        datasets: [
          {
            label: 'Completed Tasks',
            backgroundColor: 'rgba(10, 207, 151, 0.3)',
            borderColor: '#0acf97',
            data: [32, 42, 42, 62, 52, 75, 62],
          },
          {
            label: 'Plan Tasks',
            fill: true,
            backgroundColor: 'transparent',
            borderColor: '#727cf5',
            borderDash: [5, 5],
            data: [42, 58, 66, 93, 82, 105, 92],
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
                stepSize: 20,
              },
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
        this.respChart($('#line-chart-example'), 'Line', lineChart, lineOpts)
      );
    }

    return charts;
  }

  /**
   * Initlizes the project app
   */
  init() {
    // init charts
    var self = this;
    self.charts = this.initCharts();

    // enable resizing matter
    $(window).on('resize', function(e) {
      $.each(self.charts, function(index, chart) {
        try {
          chart.destroy();
        } catch (err) {
          console.log(err);
        }
      });
      self.charts = self.initCharts();
    });
  }
}

// init
var project = new Project();
project.init();
