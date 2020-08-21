/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: EcommerceDashboard
 */

import * as Chart from 'chart.js';
import 'admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js';
import 'admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en';
import 'admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css';
import '../core/hyper';

// EcommerceDashboard
class EcommerceDashboard {
  constructor() {
    this.$body = $('body');
    this.charts = [];

    // customize the chartjs styles
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

    var draw2 = Chart.controllers.doughnut.prototype.draw;
    Chart.controllers.doughnut = Chart.controllers.doughnut.extend({
      draw: function() {
        draw2.apply(this, arguments);
        var ctx = this.chart.chart.ctx;
        var _fill = ctx.fill;
        ctx.fill = function() {
          ctx.save();
          ctx.shadowColor = 'rgba(0,0,0,0.03)';
          ctx.shadowBlur = 4;
          ctx.shadowOffsetX = 0;
          ctx.shadowOffsetY = 3;
          _fill.apply(this, arguments);
          ctx.restore();
        };
      },
    });

    var draw3 = Chart.controllers.bar.prototype.draw;
    Chart.controllers.bar = Chart.controllers.bar.extend({
      draw: function() {
        draw3.apply(this, arguments);
        var ctx = this.chart.chart.ctx;
        var _fill = ctx.fill;
        ctx.fill = function() {
          ctx.save();
          ctx.shadowColor = 'rgba(0,0,0,0.01)';
          ctx.shadowBlur = 20;
          ctx.shadowOffsetX = 4;
          ctx.shadowOffsetY = 5;
          _fill.apply(this, arguments);
          ctx.restore();
        };
      },
    });

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
    if ($('#revenue-chart').length > 0) {
      var lineChart = {
        labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        datasets: [
          {
            label: 'Current Week',
            backgroundColor: 'transparent', //rgba(114, 124, 245, 0.4)
            borderColor: '#727cf5',
            data: [32, 42, 42, 62, 52, 75, 62],
          },
          {
            label: 'Previous Week',
            fill: true,
            backgroundColor: 'transparent',
            borderColor: '#0acf97',
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
          backgroundColor: '#727cf5',
          titleFontColor: '#fff',
          bodyFontColor: '#fff',
          bodyFontSize: 14,
          displayColors: false,
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
                color: 'rgba(0,0,0,0.01)',
                fontColor: '#fff',
              },
            },
          ],
        },
      };
      charts.push(
        this.respChart($('#revenue-chart'), 'Line', lineChart, lineOpts)
      );
    }

    //barchart
    if ($('#high-performing-product').length > 0) {
      // create gradient
      var ctx = document
        .getElementById('high-performing-product')
        .getContext('2d');
      var gradientStroke = ctx.createLinearGradient(0, 500, 0, 150);
      gradientStroke.addColorStop(0, '#fa5c7c');
      gradientStroke.addColorStop(1, '#727cf5');

      var barChart = {
        // labels: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        labels: [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec',
        ],
        datasets: [
          {
            label: 'Sales Analytics',
            backgroundColor: gradientStroke,
            borderColor: gradientStroke,
            hoverBackgroundColor: gradientStroke,
            hoverBorderColor: gradientStroke,
            data: [65, 59, 80, 81, 56, 89, 40, 32, 65, 59, 80, 81],
          },
          {
            label: 'Dollar Rate',
            backgroundColor: '#e3eaef',
            borderColor: '#e3eaef',
            hoverBackgroundColor: '#e3eaef',
            hoverBorderColor: '#e3eaef',
            data: [89, 40, 32, 65, 59, 80, 81, 56, 89, 40, 65, 59],
          },
        ],
      };
      var barOpts = {
        maintainAspectRatio: false,
        legend: {
          display: false,
        },
        tooltips: {
          backgroundColor: '#727cf5',
          titleFontColor: '#fff',
          bodyFontColor: '#fff',
          bodyFontSize: 14,
          displayColors: false,
        },
        scales: {
          yAxes: [
            {
              gridLines: {
                display: false,
                color: 'rgba(0,0,0,0.05)',
              },
              stacked: false,
              ticks: {
                stepSize: 20,
              },
            },
          ],
          xAxes: [
            {
              barPercentage: 0.7,
              categoryPercentage: 0.5,
              stacked: false,
              gridLines: {
                color: 'rgba(0,0,0,0.01)',
              },
            },
          ],
        },
      };

      charts.push(
        this.respChart($('#high-performing-product'), 'Bar', barChart, barOpts)
      );
    }

    if ($('#average-sales').length > 0) {
      //donut chart
      var donutChart = {
        labels: ['Direct', 'Affilliate', 'Sponsored', 'E-mail'],
        datasets: [
          {
            data: [300, 135, 48, 154],
            backgroundColor: ['#727cf5', '#fa5c7c', '#0acf97', '#ebeff2'],
            borderColor: 'transparent',
            borderWidth: '3',
          },
        ],
      };
      var donutOpts = {
        maintainAspectRatio: false,
        cutoutPercentage: 60,
        legend: {
          display: false,
        },
      };
      charts.push(
        this.respChart($('#average-sales'), 'Doughnut', donutChart, donutOpts)
      );
    }
    return charts;
  }

  /**
   * Initilizes the map
   */
  initMaps() {
    if ($('#world-map-markers').length > 0) {
      $('#world-map-markers').vectorMap({
        map: 'world_mill_en',
        normalizeFunction: 'polynomial',
        hoverOpacity: 0.7,
        hoverColor: false,
        regionStyle: {
          initial: {
            fill: '#e3eaef',
          },
        },
        markerStyle: {
          initial: {
            r: 9,
            fill: '#727cf5',
            'fill-opacity': 0.9,
            stroke: '#fff',
            'stroke-width': 7,
            'stroke-opacity': 0.4,
          },

          hover: {
            stroke: '#fff',
            'fill-opacity': 1,
            'stroke-width': 1.5,
          },
        },
        backgroundColor: 'transparent',
        markers: [
          {
            latLng: [40.71, -74.0],
            name: 'New York',
          },
          {
            latLng: [37.77, -122.41],
            name: 'San Francisco',
          },
          {
            latLng: [-33.86, 151.2],
            name: 'Sydney',
          },
          {
            latLng: [1.3, 103.8],
            name: 'Singapore',
          },
        ],
        zoomOnScroll: false,
      });
    }
  }

  /**
   * Initlizes the dashboard
   */
  init() {
    var $this = this;

    // init charts
    $this.charts = this.initCharts();

    //init maps
    this.initMaps();

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
var ds = new EcommerceDashboard();
ds.init();
