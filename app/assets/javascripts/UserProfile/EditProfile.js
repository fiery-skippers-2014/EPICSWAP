var EditProfile = {
  init: function(){
    $('div.edit-user-form').hide();
    $('a.edit-profile-link').on('click', this.showForm)
    $('form.edit_user').on('ajax:success', this.editSuccess.bind(this))
    $('form.edit_user').on('ajax:error', this.appendError)
  },
  showForm: function(e){
    e.preventDefault();
    $('div.edit-user-form').slideDown();
  },

  editSuccess: function(e, data){
    this.hideForm(e, data);
    this.appendTagline(e, data);
    this.appendDescription(e, data);
  },

  hideForm: function(e, data){
    $('div.edit-user-form').hide();
  },

  appendTagline: function(e, data){
    var tagline = data["user"]["tagline"];
    $('.tagline').html(tagline);
  },

   appendDescription: function(e, data){
    var description = data["user"]["description"];
    $('.description').html(description);
  }
}