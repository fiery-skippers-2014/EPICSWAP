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

var UserSkills = {
  query: '',
  init: function(){
    $('form.new_skill').on('ajax:success', this.appendSkill.bind(this) )
    $('form.new_skill').on('ajax:error', this.appendError )
    $('a.delete-skill').on('ajax:success', this.removeSkill )
    $('a.delete-skill').on('ajax:error', this.showError )
    $('form.new_skill input#skill_name').on('keyup', this.autoComplete.bind(this))
    $('div.skill_dropdown').on('click', 'li a', this.insertAutoComplete)
  },
  removeSkill: function(e,data){
    var id = $(e.target).data('id')
    $('li#skill_'+ id).remove()
  },
  appendSkill: function(e, data){
    console.log(data)
    $('ul.my-skills').append(data);
    $('form.new_skill').each(function(){
      this.reset();
    });
    $('div.skill_dropdown').html('')
    this.query = ''
  },
  appendError: function(e, data, f, g){
    $('ul.skill-form').prepend(data)
  },
  showError: function(e, data){
  },
  autoComplete: function(e){
    this.query = this.query + String.fromCharCode(e.which);
    var searchLetters = this.query
    var checkDBforSkill = new AjaxClient("get", "/skills/autocomplete")
    checkDBforSkill.request(searchLetters).done(this.onDataCompleteSuccess.bind(this))
                             .fail(this.onDataCompleteFail.bind(this));
  },
  onDataCompleteSuccess: function(data){
    $('div.skill_dropdown').html(data)
  },
  onDataCompleteFail: function(data){
    console.log("we messed up maaaan")
  },

  insertAutoComplete: function(e){
    e.preventDefault();
    var skill = $(this).html()
    $('input#skill_name').val(skill)
    // $('form.new_skill').trigger('ajax:success')
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