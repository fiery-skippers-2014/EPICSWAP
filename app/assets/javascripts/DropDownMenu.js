var DropDownMenu = {
  init: function(){
    $('span#menu_dropdown').on('click', this.toggleMenu)

  },
  toggleMenu: function(){
    $('ul#dropdown_menu').slideToggle();
  }
}