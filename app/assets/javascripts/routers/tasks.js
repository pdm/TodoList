Mytodolist.Routers.Tasks = Backbone.Router.extend({
  
  routes: {
    '': 'index'
  },

  initialize: function() {
    this.tasks = new Mytodolist.Collections.Tasks();
    this.tasks.fetch();
  },

  index: function() {
    var tasksView = new Mytodolist.Views.TasksIndex({
      collection: this.tasks
    });

    $('#tasks').html(tasksView.render().el);
  }

});
