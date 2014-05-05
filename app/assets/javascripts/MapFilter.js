var MapFilter = {
  init: function() {
    $('div#map_filter_menu').hide();
    $('div#filter').on('click', this.toggleFilter);
  },

  toggleFilter: function() {
    $('div#map_filter_menu').slideToggle();
  }
};
