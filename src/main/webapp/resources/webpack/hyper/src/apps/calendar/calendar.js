/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Full-Calendar
 */

import 'fullcalendar/dist/fullcalendar.min';
import 'jquery-ui/ui/draggable';
import '../../core/hyper';

// Calendar
class CalendarApp {
  constructor() {
    this.body = $('body');
    this.modal = $('#event-modal');
    this.event = '#external-events div.external-event';
    this.calendar = $('#calendar');
    this.saveCategoryBtn = $('.save-category');
    this.categoryForm = $('#add-category form');
    this.extEvents = $('#external-events');
    this.calendarObj = null;
  }

  /**
   * On drop event handler
   * @param {*} eventObj
   * @param {*} date
   */
  onDrop(eventObj, date) {
    var self = this;
    // retrieve the dropped element's stored Event Object
    var originalEventObject = eventObj.data('eventObject');
    var categoryClass = eventObj.attr('data-class');
    // we need to copy it, so that multiple events don't have a reference to the same object
    var copiedEventObject = $.extend({}, originalEventObject);
    // assign it the date that was reported
    copiedEventObject.start = date;
    if (categoryClass) copiedEventObject['className'] = [categoryClass];
    // render the event on the calendar
    self.calendar.fullCalendar('renderEvent', copiedEventObject, true);
    // is the "remove after drop" checkbox checked?
    if ($('#drop-remove').is(':checked')) {
      // if so, remove the element from the "Draggable Events" list
      eventObj.remove();
    }
  }

  /**
   * On click event
   * @param {*} calEvent
   */
  onEventClick(calEvent) {
    var self = this;
    var form = $('<form></form>');
    form.append('<label>Change event name</label>');
    form.append(
      "<div class='input-group m-b-15'><input class='form-control' type=text value='" +
        calEvent.title +
        "' /><span class='input-group-append'><button type='submit' class='btn btn-success btn-md  '><i class='fa fa-check'></i> Save</button></span></div>"
    );
    self.modal.modal({
      backdrop: 'static',
    });
    self.modal
      .find('.delete-event')
      .show()
      .end()
      .find('.save-event')
      .hide()
      .end()
      .find('.modal-body')
      .empty()
      .prepend(form)
      .end()
      .find('.delete-event')
      .unbind('click')
      .click(function() {
        self.calendarObj.fullCalendar('removeEvents', function(ev) {
          return ev._id == calEvent._id;
        });
        self.modal.modal('hide');
      });
    self.modal.find('form').on('submit', function() {
      calEvent.title = form.find('input[type=text]').val();
      self.calendarObj.fullCalendar('updateEvent', calEvent);
      self.modal.modal('hide');
      return false;
    });
  }

  /**
   * On select event
   * @param {*} start
   * @param {*} end
   */
  onSelect(start, end) {
    var self = this;
    self.modal.modal({
      backdrop: 'static',
    });
    var form = $('<form></form>');
    form.append("<div class='row'></div>");
    form
      .find('.row')
      .append(
        "<div class='col-12'><div class='form-group'><label class='control-label'>Event Name</label><input class='form-control' placeholder='Insert Event Name' type='text' name='title'/></div></div>"
      )
      .append(
        "<div class='col-12'><div class='form-group'><label class='control-label'>Category</label><select class='form-control' name='category'></select></div></div>"
      )
      .find("select[name='category']")
      .append("<option value='bg-danger'>Danger</option>")
      .append("<option value='bg-success'>Success</option>")
      .append("<option value='bg-primary'>Primary</option>")
      .append("<option value='bg-info'>Info</option>")
      .append("<option value='bg-dark'>Dark</option>")
      .append("<option value='bg-warning'>Warning</option></div></div>");
    self.modal
      .find('.delete-event')
      .hide()
      .end()
      .find('.save-event')
      .show()
      .end()
      .find('.modal-body')
      .empty()
      .prepend(form)
      .end()
      .find('.save-event')
      .unbind('click')
      .click(function() {
        form.submit();
      });
    self.modal.find('form').on('submit', function() {
      var title = form.find("input[name='title']").val();
      var categoryClass = form
        .find("select[name='category'] option:checked")
        .val();
      if (title !== null && title.length != 0) {
        self.calendarObj.fullCalendar(
          'renderEvent',
          {
            title: title,
            start: start,
            end: end,
            allDay: false,
            className: categoryClass,
          },
          true
        );
        self.modal.modal('hide');
      } else {
        alert('You have to give a title to your event');
      }
      return false;
    });
    self.calendarObj.fullCalendar('unselect');
  }

  /**
   * Enables the drag support
   */
  enableDrag() {
    //init events
    $(this.event).each(function() {
      // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
      // it doesn't need to have a start or end
      var eventObject = {
        title: $.trim($(this).text()), // use the element's text as the event title
      };
      // store the Event Object in the DOM element so we can get to it later
      $(this).data('eventObject', eventObject);
      // make the event draggable using jQuery UI
      $(this).draggable({
        zIndex: 999,
        revert: true, // will cause the event to go back to its
        revertDuration: 0, //  original position after the drag
      });
    });
  }

  /**
   * Init the app
   */
  init() {
    this.enableDrag();
    /*  Initialize the calendar  */
    var today = new Date($.now());

    var defaultEvents = [
      {
        title: 'Hey!',
        start: new Date($.now() + 158000000),
        className: 'bg-warning',
      },
      {
        title: 'See John Deo',
        start: today,
        end: today,
        className: 'bg-success',
      },
      {
        title: 'Meet John Deo',
        start: new Date($.now() + 168000000),
        className: 'bg-info',
      },
      {
        title: 'Buy a Theme',
        start: new Date($.now() + 338000000),
        className: 'bg-primary',
      },
    ];

    var self = this;
    self.calendarObj = self.calendar.fullCalendar({
      slotDuration:
        '00:15:00' /* If we want to split day time each 15minutes */,
      minTime: '08:00:00',
      maxTime: '19:00:00',
      defaultView: 'month',
      handleWindowResize: true,
      height: $(window).height() - 200,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay',
      },
      events: defaultEvents,
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar !!!
      eventLimit: true, // allow "more" link when too many events
      selectable: true,
      drop: function(date) {
        self.onDrop($(this), date);
      },
      select: function(start, end, allDay) {
        self.onSelect(start, end, allDay);
      },
      eventClick: function(calEvent, jsEvent, view) {
        self.onEventClick(calEvent, jsEvent, view);
      },
    });

    //on new event
    this.saveCategoryBtn.on('click', function() {
      var categoryName = self.categoryForm
        .find("input[name='category-name']")
        .val();
      var categoryColor = self.categoryForm
        .find("select[name='category-color']")
        .val();
      if (categoryName !== null && categoryName.length != 0) {
        self.extEvents.append(
          '<div class="external-event bg-' +
            categoryColor +
            '" data-class="bg-' +
            categoryColor +
            '" style="position: relative;"><i class="mdi mdi-checkbox-blank-circle mr-2 vertical-middle"></i>' +
            categoryName +
            '</div>'
        );
        self.enableDrag();
      }
    });
  }
}

// init
var calendarApp = new CalendarApp();
calendarApp.init();
