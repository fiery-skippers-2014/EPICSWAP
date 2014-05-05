var UserInterests = {
  init: function(){
    $('form.new_interest').on('ajax:success', this.appendInterest )
    $('form.new_interest').on('ajax:error', this.appendError )
    $('a.delete-interest').on('ajax:success', this.removeInterest )
    $('a.delete-interest').on('ajax:error', this.showErrorInterest )
  },

  removeInterest: function(e,data){
    var id = $(e.target).data('id')
    $('li#interest_'+ id).remove()
  },

  appendInterest: function(e, data){
    $('ul.my-interests').append(data)
    $('form.new_interest').each(function(){
      this.reset();
    });
  },

  appendError: function(e, data){
    $('ul.my-interests').append(data)
  }
}