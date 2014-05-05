var DropDownMenu = {
  init: function(){
    $('ul#dropdown_menu').hide();
    $('span#menu_dropdown').on('click', this.toggleMenu);

  },
  toggleMenu: function(){
    $('ul#dropdown_menu').slideToggle();
  }
}