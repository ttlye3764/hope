/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: Apex HeatMap Charts
 */

import * as ApexCharts from 'apexcharts/dist/apexcharts';
import '../../core/hyper';

class ApexHeatMap {
  constructor() {}

  generateData(count, yrange) {
    var i = 0;
    var series = [];
    while (i < count) {
      var x = (i + 1).toString();
      var y =
        Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min;

      series.push({
        x: x,
        y: y,
      });
      i++;
    }
    return series;
  }

  /**
   * Initilizes the charts
   */
  initCharts() {
    var self = this;

    var options = {
      chart: {
        height: 380,
        type: 'heatmap',
      },
      dataLabels: {
        enabled: false,
      },
      colors: ['#727cf5'],
      series: [
        {
          name: 'Metric 1',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 2',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 3',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 4',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 5',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric  6',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 7',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 8',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 9',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
      ],
      xaxis: {
        type: 'category',
      },
    };

    var chart = new ApexCharts(
      document.querySelector('#basic-heatmap'),
      options
    );

    chart.render();

    options = {
      chart: {
        height: 380,
        type: 'heatmap',
      },
      dataLabels: {
        enabled: false,
      },
      colors: [
        '#F3B415',
        '#F27036',
        '#663F59',
        '#6A6E94',
        '#4E88B4',
        '#00A7C6',
        '#18D8D8',
        '#A9D794',
        '#46AF78',
      ],
      series: [
        {
          name: 'Metric 1',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 2',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 3',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 4',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 5',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 6',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 7',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 8',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric 9',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
      ],
      xaxis: {
        type: 'category',
      },
    };

    chart = new ApexCharts(
      document.querySelector('#multiple-series-heatmap'),
      options
    );

    chart.render();

    options = {
      chart: {
        height: 380,
        type: 'heatmap',
      },
      plotOptions: {
        heatmap: {
          shadeIntensity: 0.5,

          colorScale: {
            ranges: [
              {
                from: -30,
                to: 5,
                name: 'Low',
                color: '#0acf97',
              },
              {
                from: 6,
                to: 20,
                name: 'Medium',
                color: '#39afd1',
              },
              {
                from: 21,
                to: 45,
                name: 'High',
                color: '#ffbc00',
              },
              {
                from: 46,
                to: 55,
                name: 'Extreme',
                color: '#fa5c7c',
              },
            ],
          },
        },
      },
      dataLabels: {
        enabled: false,
      },
      series: [
        {
          name: 'Jan',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'Feb',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'Mar',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'Apr',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'May',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'Jun',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'Jul',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'Aug',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
        {
          name: 'Sep',
          data: self.generateData(20, {
            min: -30,
            max: 55,
          }),
        },
      ],
    };

    chart = new ApexCharts(
      document.querySelector('#color-range-heatmap'),
      options
    );

    chart.render();

    options = {
      chart: {
        height: 380,
        type: 'heatmap',
      },
      stroke: {
        width: 0,
      },
      plotOptions: {
        heatmap: {
          radius: 30,
          enableShades: false,
          colorScale: {
            ranges: [
              {
                from: 0,
                to: 50,
                color: '#39afd1',
              },
              {
                from: 51,
                to: 100,
                color: '#0acf97',
              },
            ],
          },
        },
      },
      dataLabels: {
        enabled: true,
        style: {
          colors: ['#fff'],
        },
      },
      series: [
        {
          name: 'Metric1',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric2',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric3',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric4',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric5',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric6',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric7',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric8',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
        {
          name: 'Metric8',
          data: self.generateData(20, {
            min: 0,
            max: 90,
          }),
        },
      ],

      xaxis: {
        type: 'category',
      },
      grid: {
        borderColor: '#f1f3fa',
      },
    };

    chart = new ApexCharts(document.querySelector('#rounded-heatmap'), options);

    chart.render();
  }
  /**
   * Initilizes the chart
   */
  init() {
    this.initCharts();
  }
}

// init
var apexHeatMap = new ApexHeatMap();
apexHeatMap.init();
