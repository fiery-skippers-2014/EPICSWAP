var UserInterests = {
  init: function(){
    $('form.new_interest').on('ajax:success', this.appendInterest );
    $('form.new_interest').on('ajax:error', this.appendError );
    $('a.delete-interest').on('ajax:success', this.removeInterest );
    $('a.delete-interest').on('ajax:error', this.showErrorInterest );
    $('form.new_interest input#interest_name').on('keyup', this.autoComplete.bind(this));
    $('#interest_dropdown').on('click', 'li a', this.insertAutoComplete)
    $('div.initial input.initial-interest-submit').on('click', this.redirectToUserPage)
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
    $('div.interest_dropdown').html('');
  },

  appendError: function(e, data){
    $('ul.my-interests').append(data)
  },

  autoComplete: function(e){
    var searchLetters   = $("#interest_name").val();
    var checkDBforInterest = new AjaxClient("get", "/interests/autocomplete")
    checkDBforInterest.request(searchLetters)
                   .done(this.onDataCompleteSuccess.bind(this))
                   .fail(this.onDataCompleteFail.bind(this));
  },

  onDataCompleteSuccess: function(data){
    $('#interest_dropdown').html(data);
  },

  onDataCompleteFail: function(data){
    console.log("Error in Interest onDataCompleteFail")
  },

  insertAutoComplete: function(e){
    e.preventDefault();
    var interest = $(this).html()
    $('input#interest_name').val(interest)
  },
  redirectToUserPage: function(e){
    window.location.replace("/")
  }
}