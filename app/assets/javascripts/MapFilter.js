var MapFilter = {
  init: function() {
    $('div#map_filter_menu').hide();
    $('div#filter').on('click', this.toggleFilter);
    $('filter_link').on('click', this.filterCategories)
  },

  toggleFilter: function() {
    $('div#map_filter_menu').slideToggle();
  },
  filterCategories: function(e){
    e.preventDefault()
    var cat_title = $(e.target).data('title')
    $('[title=' + cat_title + ']').toggle()

  }
};
