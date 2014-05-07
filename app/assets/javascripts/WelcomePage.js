var WelcomePage = {
  init: function() {
    $('#more-info-link').on('click', this.showInfo);
  },

  showInfo: function(e) {
    e.preventDefault();

    $('#more-info').slideToggle();
  }
}
