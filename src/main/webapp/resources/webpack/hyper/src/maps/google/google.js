/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Module/App: GoogleMaps
 */

import GMaps from 'gmaps/gmaps.min';
import '../../core/hyper';

class GoogleMaps {
  constructor() {}

  /**
   * creates the basic map
   * @param {*} container
   * @param {*} lat
   * @param {*} lng
   */
  createBasic(container, lat, lng) {
    return new GMaps({
      div: container,
      lat: lat,
      lng: lng,
    });
  }

  /**
   * creates map with markers
   * @param {*} container
   * @param {*} lat
   * @param {*} lng
   */
  createMarkers(container, lat, lng) {
    var map = new GMaps({
      div: container,
      lat: lat,
      lng: lng,
    });

    //sample markers, but you can pass actual marker data as function parameter
    map.addMarker({
      lat: -12.043333,
      lng: -77.03,
      title: 'Lima',
      details: {
        database_id: 42,
        author: 'HPNeo',
      },
      click: function(e) {
        if (console.log) console.log(e);
        alert('You clicked in this marker');
      },
    });
    map.addMarker({
      lat: -12.042,
      lng: -77.028333,
      title: 'Marker with InfoWindow',
      infoWindow: {
        content: '<p>HTML Content</p>',
      },
    });

    return map;
  }

  /**
   * creates map with street view
   * @param {*} container
   * @param {*} lat
   * @param {*} lng
   */
  createWithStreetview(container, lat, lng) {
    return GMaps.createPanorama({
      el: container,
      lat: lat,
      lng: lng,
    });
  }

  /**
   * creates map by type
   * @param {*} container
   * @param {*} lat
   * @param {*} lng
   */
  createMapByType(container, lat, lng) {
    var map = new GMaps({
      div: container,
      lat: lat,
      lng: lng,
      mapTypeControlOptions: {
        mapTypeIds: [
          'hybrid',
          'roadmap',
          'satellite',
          'terrain',
          'osm',
          'cloudmade',
        ],
      },
    });
    map.addMapType('osm', {
      getTileUrl: function(coord, zoom) {
        return (
          'http://tile.openstreetmap.org/' +
          zoom +
          '/' +
          coord.x +
          '/' +
          coord.y +
          '.png'
        );
      },
      tileSize: new window.google.maps.Size(256, 256),
      name: 'OpenStreetMap',
      maxZoom: 18,
    });
    map.addMapType('cloudmade', {
      getTileUrl: function(coord, zoom) {
        return (
          'http://b.tile.cloudmade.com/8ee2a50541944fb9bcedded5165f09d9/1/256/' +
          zoom +
          '/' +
          coord.x +
          '/' +
          coord.y +
          '.png'
        );
      },
      tileSize: new window.google.maps.Size(256, 256),
      name: 'CloudMade',
      maxZoom: 18,
    });
    map.setMapTypeId('osm');
    return map;
  }

  /**
   * creates map with style
   * @param {*} container
   * @param {*} styleJson
   */
  createWithStyle(container, styleJson, lat, lng) {
    new GMaps({
      div: container,
      lat: lat,
      lng: lng,
      styles: styleJson,
    });
  }

  /**
   * Initilizes the GoogleMaps
   */
  init() {
    var self = this;
    // creating basic map
    self.createBasic('#gmaps-basic', -12.043333, -77.028333),
      // with sample markers
      self.createMarkers('#gmaps-markers', -12.043333, -77.028333);

    // street view
    self.createWithStreetview('#panorama', 40.7295174, -73.9986496);

    //types
    self.createMapByType('#gmaps-types', -12.043333, -77.028333);

    // style - ultra light
    self.createWithStyle(
      '#ultra-light',
      [
        {
          featureType: 'water',
          elementType: 'geometry',
          stylers: [
            {
              color: '#e9e9e9',
            },
            {
              lightness: 17,
            },
          ],
        },
        {
          featureType: 'landscape',
          elementType: 'geometry',
          stylers: [
            {
              color: '#f5f5f5',
            },
            {
              lightness: 20,
            },
          ],
        },
        {
          featureType: 'road.highway',
          elementType: 'geometry.fill',
          stylers: [
            {
              color: '#ffffff',
            },
            {
              lightness: 17,
            },
          ],
        },
        {
          featureType: 'road.highway',
          elementType: 'geometry.stroke',
          stylers: [
            {
              color: '#ffffff',
            },
            {
              lightness: 29,
            },
            {
              weight: 0.2,
            },
          ],
        },
        {
          featureType: 'road.arterial',
          elementType: 'geometry',
          stylers: [
            {
              color: '#ffffff',
            },
            {
              lightness: 18,
            },
          ],
        },
        {
          featureType: 'road.local',
          elementType: 'geometry',
          stylers: [
            {
              color: '#ffffff',
            },
            {
              lightness: 16,
            },
          ],
        },
        {
          featureType: 'poi',
          elementType: 'geometry',
          stylers: [
            {
              color: '#f5f5f5',
            },
            {
              lightness: 21,
            },
          ],
        },
        {
          featureType: 'poi.park',
          elementType: 'geometry',
          stylers: [
            {
              color: '#dedede',
            },
            {
              lightness: 21,
            },
          ],
        },
        {
          elementType: 'labels.text.stroke',
          stylers: [
            {
              visibility: 'on',
            },
            {
              color: '#ffffff',
            },
            {
              lightness: 16,
            },
          ],
        },
        {
          elementType: 'labels.text.fill',
          stylers: [
            {
              saturation: 36,
            },
            {
              color: '#333333',
            },
            {
              lightness: 40,
            },
          ],
        },
        {
          elementType: 'labels.icon',
          stylers: [
            {
              visibility: 'off',
            },
          ],
        },
        {
          featureType: 'transit',
          elementType: 'geometry',
          stylers: [
            {
              color: '#f2f2f2',
            },
            {
              lightness: 19,
            },
          ],
        },
        {
          featureType: 'administrative',
          elementType: 'geometry.fill',
          stylers: [
            {
              color: '#fefefe',
            },
            {
              lightness: 20,
            },
          ],
        },
        {
          featureType: 'administrative',
          elementType: 'geometry.stroke',
          stylers: [
            {
              color: '#fefefe',
            },
            {
              lightness: 17,
            },
            {
              weight: 1.2,
            },
          ],
        },
      ],
      -12.043333,
      -77.028333
    );

    self.createWithStyle(
      '#dark',
      [
        {
          featureType: 'all',
          elementType: 'labels',
          stylers: [
            {
              visibility: 'on',
            },
          ],
        },
        {
          featureType: 'all',
          elementType: 'labels.text.fill',
          stylers: [
            {
              saturation: 36,
            },
            {
              color: '#000000',
            },
            {
              lightness: 40,
            },
          ],
        },
        {
          featureType: 'all',
          elementType: 'labels.text.stroke',
          stylers: [
            {
              visibility: 'on',
            },
            {
              color: '#000000',
            },
            {
              lightness: 16,
            },
          ],
        },
        {
          featureType: 'all',
          elementType: 'labels.icon',
          stylers: [
            {
              visibility: 'off',
            },
          ],
        },
        {
          featureType: 'administrative',
          elementType: 'geometry.fill',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 20,
            },
          ],
        },
        {
          featureType: 'administrative',
          elementType: 'geometry.stroke',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 17,
            },
            {
              weight: 1.2,
            },
          ],
        },
        {
          featureType: 'administrative.country',
          elementType: 'labels.text.fill',
          stylers: [
            {
              color: '#e5c163',
            },
          ],
        },
        {
          featureType: 'administrative.locality',
          elementType: 'labels.text.fill',
          stylers: [
            {
              color: '#c4c4c4',
            },
          ],
        },
        {
          featureType: 'administrative.neighborhood',
          elementType: 'labels.text.fill',
          stylers: [
            {
              color: '#e5c163',
            },
          ],
        },
        {
          featureType: 'landscape',
          elementType: 'geometry',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 20,
            },
          ],
        },
        {
          featureType: 'poi',
          elementType: 'geometry',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 21,
            },
            {
              visibility: 'on',
            },
          ],
        },
        {
          featureType: 'poi.business',
          elementType: 'geometry',
          stylers: [
            {
              visibility: 'on',
            },
          ],
        },
        {
          featureType: 'road.highway',
          elementType: 'geometry.fill',
          stylers: [
            {
              color: '#e5c163',
            },
            {
              lightness: '0',
            },
          ],
        },
        {
          featureType: 'road.highway',
          elementType: 'geometry.stroke',
          stylers: [
            {
              visibility: 'off',
            },
          ],
        },
        {
          featureType: 'road.highway',
          elementType: 'labels.text.fill',
          stylers: [
            {
              color: '#ffffff',
            },
          ],
        },
        {
          featureType: 'road.highway',
          elementType: 'labels.text.stroke',
          stylers: [
            {
              color: '#e5c163',
            },
          ],
        },
        {
          featureType: 'road.arterial',
          elementType: 'geometry',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 18,
            },
          ],
        },
        {
          featureType: 'road.arterial',
          elementType: 'geometry.fill',
          stylers: [
            {
              color: '#575757',
            },
          ],
        },
        {
          featureType: 'road.arterial',
          elementType: 'labels.text.fill',
          stylers: [
            {
              color: '#ffffff',
            },
          ],
        },
        {
          featureType: 'road.arterial',
          elementType: 'labels.text.stroke',
          stylers: [
            {
              color: '#2c2c2c',
            },
          ],
        },
        {
          featureType: 'road.local',
          elementType: 'geometry',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 16,
            },
          ],
        },
        {
          featureType: 'road.local',
          elementType: 'labels.text.fill',
          stylers: [
            {
              color: '#999999',
            },
          ],
        },
        {
          featureType: 'transit',
          elementType: 'geometry',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 19,
            },
          ],
        },
        {
          featureType: 'water',
          elementType: 'geometry',
          stylers: [
            {
              color: '#000000',
            },
            {
              lightness: 17,
            },
          ],
        },
      ],
      -12.043333,
      -77.028333
    );
  }
}

// init
var googleMaps = new GoogleMaps();
googleMaps.init();
