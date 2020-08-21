/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Profile
 */

import * as Chart from 'chart.js';
import '../../core/hyper';

// Shared
class Profile {
  constructor() {
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
   * Initilizes charts
   */
  initCharts() {
    var charts = [];

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
            label: 'Orders',
            backgroundColor: gradientStroke,
            borderColor: gradientStroke,
            hoverBackgroundColor: gradientStroke,
            hoverBorderColor: gradientStroke,
            data: [65, 59, 80, 81, 56, 89, 40, 32, 65, 59, 80, 81],
          },
          {
            label: 'Revenue',
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
  }
  /**
   * Initlizes
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

// init profile
var profile = new Profile();
profile.init();
