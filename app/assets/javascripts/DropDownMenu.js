var DropDownMenu = {
  init: function(){

    $('ul#dropdown_menu').hide();
    $('span#menu_dropdown').on('click', this.toggleMenu);
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
