window.Mytodolist = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  init: function() {
    new Mytodolist.Routers.Tasks();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Mytodolist.init();
});
