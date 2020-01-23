(function() {
  App.room = App.cable.subscriptions.create("WebNotificationsChannel", {
    received: function(data) {
      let element = document.getElementById('posts-list')
      element.insertAdjacentHTML('beforeend', data.message)
    }
  });

}).call(this);