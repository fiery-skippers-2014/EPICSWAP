var DropDownMenu = {
  init: function(){
    $('span#menu_dropdown').on('click', this.toggleMenu);
    $('ul#dropdown_menu').slideUp();
  },

  toggleMenu: function(){
    $('ul#dropdown_menu').slideToggle();
  },

  menuUp: function() {
    $('ul#dropdown_menu').slideUp();
  },

  menuDown: function() {
    $('ul#dropdown_menu').slideDown();
  }
};
