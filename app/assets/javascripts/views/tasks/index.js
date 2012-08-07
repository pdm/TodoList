Mytodolist.Views.TasksIndex = Backbone.View.extend({

  template: JST['tasks/index'],

  events: {
    'submit #new-task': 'createTask',
    'click .remove-task': 'removeTask'
  },

  initialize: function() {
    this.collection.on('reset', this.render, this);
  },

  render: function() {
    $(this.el).html(this.template({
      tasks: this.collection
    }));
    return this;
  },

  createTask: function(event) {
    event.preventDefault();

    var attributes = {
      content: $('#new-task-content').val(),
      done: $('#new-task-done').val()
    }
    this.collection.create(attributes, {
      wait: false,
      success: function() {
        $('#new-task')[0].reset();
      },
      error: this.handleError
    });
    this.collection.trigger('reset');
  },

  removeTask: function(event) {
    event.preventDefault();
    this.collection.get(event.target.id).destroy();
    this.collection.trigger('reset');
  },

  handleError: function(post, response) {
    if (response.status == 422) {
      var errors = $.parseJSON(response.responseText).errors;
      for (attribute in errors) {
        var messages = errors[attribute];
        for (var i = 0, len = messages.length; i < len; i++) {
          message = messages[i];
          alert("" + attribute + " " + message);
        }
      }
    }
  } 

});
