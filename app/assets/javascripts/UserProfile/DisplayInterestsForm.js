var DisplayInterestsForm = {
  init: function() {
    $("#add_interest_link").on("click", this.toggleForm);
    $('div.initial #interest-form').show()
  },

  toggleForm: function() {
    $("#interest-form").slideToggle();
  }
}
