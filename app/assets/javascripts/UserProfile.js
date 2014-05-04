var UserInterests = {
  init: function(){
    $('form.new_interest').on('ajax:success', this.appendInterest )
    $('form.new_interest').on('ajax:error', this.appendError )
    $('a.delete-interest').on('ajax:success', this.removeInterest )
    $('a.delete-interest').on('ajax:error', this.showErrorInterest )
  },

  removeInterest: function(e,data){
    var id = $(e.target).data('id')
    console.log(id)
    $('li#interest_'+ id).remove()
  },

  appendInterest: function(e, data){
    console.log('success')
    console.log(data)
    $('ul.my-interests').append(data)
    $('form.new_interest').each(function(){
      this.reset();
    });
  },

  appendError: function(e, data){
    console.log('error')
    console.log(data);
  }
}

var UserSkills = {
  init: function(){
    $('form.new_skill').on('ajax:success', this.appendSkill )
    $('form.new_skill').on('ajax:error', this.appendError )
    $('a.delete-skill').on('ajax:success', this.removeSkill )
    $('a.delete-skill').on('ajax:error', this.showError )

  },

  removeSkill: function(e,data){
    var id = $(e.target).data('id')
    $('li#skill_'+ id).remove()
  },


  appendSkill: function(e, data){
    $('ul.my-skills').append(data);
    $('form.new_skill').each(function(){
      this.reset();
    });
  },

  appendError: function(e, data){
    console.log(data);
    console.log(e)
  },
  showError: function(e, data){
    console.log('error')
  }
}

var UserReputation = {
  init: function(){
    $('form.new_reputation').on('ajax:success', this.appendReputation )
    $('form.new_reputation').on('ajax:error', this.appendError )
  },
  appendReputation: function(e, data){
    $('form.new_reputation').hide();
    $('p#user-reputation').html(data.score)
  },

  appendError: function(e, data){
    console.log('fail');
  }
}

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