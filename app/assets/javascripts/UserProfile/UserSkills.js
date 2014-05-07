var UserSkills = {
  init: function(){
    $('form.new_skill').on('ajax:success', this.appendSkill.bind(this) )
    $('form.new_skill').on('ajax:error', this.appendError )
    $('a.delete-skill').on('ajax:success', this.removeSkill )
    $('a.delete-skill').on('ajax:error', this.showError )
    $('form.new_skill input#skill_name').on('keyup', this.autoComplete.bind(this))
    $('#skill_dropdown').on('click', 'a', this.insertAutoComplete)
    $("#skill-dropdown-row").hide();
  },

  removeSkill: function(e,data){
    var id = $(e.target).data('id');
    $('tr#skill_'+ id).remove();
  },

  appendSkill: function(e, data){
    var numSkills = $('table.my-skills tr').length
    $('.my-skills').append(data);
    $('form.new_skill').each(function(){
      this.reset();
    });
    $('div.skill_dropdown').html('');
    $('div.initial.add-skill').hide()
    $('div.initial.add-interests').slideDown()
    if (numSkills == 2) {
      this.maxSkills()
    };
  },

  appendError: function(e, data, f, g){
    console.log('error')
    console.log(data.responseText)
    $('#skill_errors').html(data.responseText)
  },

  showError: function(e, data){
    console.log("error in UserSkills.showError")
  },

  autoComplete: function(e){
    $("#skill-dropdown-row").show();
    var searchLetters   = $("#skill_name").val();
    var checkDBforSkill = new AjaxClient("get", "/skills/autocomplete")
    checkDBforSkill.request(searchLetters)
                   .done(this.onDataCompleteSuccess.bind(this))
                   .fail(this.onDataCompleteFail.bind(this));
  },

  onDataCompleteSuccess: function(data){
    $('#skill_dropdown').html(data)
  },

  onDataCompleteFail: function(data){
    console.log("Error in Skill onDataCompleteFail")
  },

  insertAutoComplete: function(e){
    e.preventDefault();
    var skill = $(this).html()
    $('input#skill_name').val(skill)
    $("#skill-dropdown-row").hide();
    $("#add_skill").trigger('submit');
    $("#skill-form").hide();
  },
  maxSkills: function(){
    $('#add_skill_link').hide()
    $('form.new_skill').hide()
    $('#max_skills_dynamic').html('You can have a maximum of 3 skills')
  }
}
