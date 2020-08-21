/**
 * Theme: Hyper - Responsive Bootstrap 4 Admin Dashboard
 * Author: Coderthemes
 * Component: Chat Widget
 */

import moment from 'moment';

// Chat
class Chat {
  constructor() {
    this.body = $('body');
    this.chatInput = $('.chat-input');
    this.chatList = $('.conversation-list');
    this.chatSendBtn = $('.chat-send');
    this.chatForm = $('#chat-form');
  }

  /**
   * Saves the entered text as chat message
   */
  save() {
    var chatText = this.chatInput.val();
    var chatTime = moment().format('h:mm');
    if (chatText == '') {
      this.chatInput.focus();
      return false;
    } else {
      $(
        '<li class="clearfix odd"><div class="chat-avatar"><img src="./public/images/users/avatar-1.jpg" alt="male"><i>' +
          chatTime +
          '</i></div><div class="conversation-text"><div class="ctext-wrap"><i>Dominic</i><p>' +
          chatText +
          '</p></div></div></li>'
      ).appendTo('.conversation-list');
      this.chatInput.val(' ');
      this.chatInput.focus();
      this.chatList.animate(
        { scrollTop: this.chatList.prop('scrollHeight') },
        1000
      );
      return true;
    }
  }

  /**
   * Initilizes the widget
   */
  init() {
    var self = this;
    //binding keypress event on chat input box - on enter we are adding the chat into chat list -
    self.chatInput.keypress(function(ev) {
      var p = ev.which;
      if (p == 13) {
        self.save();
        return false;
      }
    });

    //binding send button click
    self.chatForm.on('submit', function(ev) {
      ev.preventDefault();
      self.save();
      return false;
    });
  }
}

export default Chat;
