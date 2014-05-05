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
