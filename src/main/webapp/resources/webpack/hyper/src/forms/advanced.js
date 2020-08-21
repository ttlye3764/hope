/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Advanced demo
 */

import Bloodhound from 'typeahead.js/dist/typeahead.bundle.min';
import 'bootstrap-datepicker/dist/js/bootstrap-datepicker.min';
import 'bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css';
import '../core/hyper';

// Advanced
class Advanced {
  constructor() {}

  /**
   * Substring matcher function
   * @param {*} strs
   */
  substringMatcher(strs) {
    return function findMatches(q, cb) {
      var matches, substrRegex;

      // an array that will be populated with substring matches
      matches = [];

      // regex used to determine if a string contains the substring `q`
      substrRegex = new RegExp(q, 'i');

      // iterate through the pool of strings and for any string that
      // contains the substring `q`, add it to the `matches` array
      $.each(strs, function(i, str) {
        if (substrRegex.test(str)) {
          matches.push(str);
        }
      });

      cb(matches);
    };
  }
  /**
   * Initlizes
   */
  init() {
    var self = this;

    var states = [
      'Alabama',
      'Alaska',
      'Arizona',
      'Arkansas',
      'California',
      'Colorado',
      'Connecticut',
      'Delaware',
      'Florida',
      'Georgia',
      'Hawaii',
      'Idaho',
      'Illinois',
      'Indiana',
      'Iowa',
      'Kansas',
      'Kentucky',
      'Louisiana',
      'Maine',
      'Maryland',
      'Massachusetts',
      'Michigan',
      'Minnesota',
      'Mississippi',
      'Missouri',
      'Montana',
      'Nebraska',
      'Nevada',
      'New Hampshire',
      'New Jersey',
      'New Mexico',
      'New York',
      'North Carolina',
      'North Dakota',
      'Ohio',
      'Oklahoma',
      'Oregon',
      'Pennsylvania',
      'Rhode Island',
      'South Carolina',
      'South Dakota',
      'Tennessee',
      'Texas',
      'Utah',
      'Vermont',
      'Virginia',
      'Washington',
      'West Virginia',
      'Wisconsin',
      'Wyoming',
    ];

    $('#the-basics').typeahead(
      {
        hint: true,
        highlight: true,
        minLength: 1,
      },
      {
        name: 'states',
        source: self.substringMatcher(states),
      }
    );

    // bloodhound
    // ----------

    // constructs the suggestion engine
    states = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.whitespace,
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      // `states` is an array of state names defined in "The Basics"
      local: states,
    });

    $('#bloodhound').typeahead(
      {
        hint: true,
        highlight: true,
        minLength: 1,
      },
      {
        name: 'states',
        source: states,
      }
    );

    // prefetch
    // --------

    var countries = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.whitespace,
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      // url points to a json file that contains an array of country names, see
      prefetch:
        'https://raw.githubusercontent.com/twitter/typeahead.js/gh-pages/data/countries.json',
    });

    // passing in `null` for the `options` arguments will result in the default
    // options being used
    $('#prefetch').typeahead(null, {
      name: 'countries',
      source: countries,
    });

    // remote
    // ------

    var bestPictures = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch:
        'https://raw.githubusercontent.com/twitter/typeahead.js/gh-pages/data/films/post_1960.json',
      remote: {
        url: '../plugins/typeahead/data/%QUERY.json',
        wildcard: '%QUERY',
      },
    });

    $('#remote').typeahead(null, {
      name: 'best-pictures',
      display: 'value',
      source: bestPictures,
    });

    // default suggestions
    // -------------------

    var nflTeams = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('team'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      identify: function(obj) {
        return obj.team;
      },
      prefetch:
        'https://raw.githubusercontent.com/twitter/typeahead.js/gh-pages/data/nfl.json',
    });

    function nflTeamsWithDefaults(q, sync) {
      if (q === '') {
        sync(
          nflTeams.get('Detroit Lions', 'Green Bay Packers', 'Chicago Bears')
        );
      } else {
        nflTeams.search(q, sync);
      }
    }

    $('#default-suggestions').typeahead(
      {
        minLength: 0,
        highlight: true,
      },
      {
        name: 'nfl-teams',
        display: 'team',
        source: nflTeamsWithDefaults,
      }
    );

    // custom templates
    // ----------------

    $('#custom-templates').typeahead(null, {
      name: 'best-pictures',
      display: 'value',
      source: bestPictures,
      templates: {
        empty: [
          '<div class="typeahead-empty-message">',
          'Unable to find any Best Picture winners that match the current query',
          '</div>',
        ].join('\n'),
        suggestion: function(data) {
          return (
            '<div><strong>' + data.value + '</strong> - ' + data.year + '</div>'
          );
        },
      },
    });

    // multiple datasets
    // -----------------

    var nbaTeams = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('team'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch:
        'https://raw.githubusercontent.com/twitter/typeahead.js/gh-pages/data/nba.json',
    });

    var nhlTeams = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace('team'),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch:
        'https://raw.githubusercontent.com/twitter/typeahead.js/gh-pages/data/nhl.json',
    });

    $('#multiple-datasets').typeahead(
      {
        highlight: true,
      },
      {
        name: 'nba-teams',
        display: 'team',
        source: nbaTeams,
        templates: {
          header: '<h5 class="league-name">NBA Teams</h5>',
        },
      },
      {
        name: 'nhl-teams',
        display: 'team',
        source: nhlTeams,
        templates: {
          header: '<h5 class="league-name">NHL Teams</h5>',
        },
      }
    );
  }
}

// init Advanced
var advanced = new Advanced();
advanced.init();
