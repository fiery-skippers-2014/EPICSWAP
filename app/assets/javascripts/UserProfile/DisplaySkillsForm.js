var DisplaySkillsForm = {
  init: function() {
    $("#add_skill_link").on("click", this.toggleForm);
    $('div.initial #skill-form').show()
  },

  toggleForm: function() {
    $("#skill-form").slideToggle();
  }
}
