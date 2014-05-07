$(document).ready(function(){

  //////////////////////
  /// Homepage + Menu///
  //////////////////////

  DropDownMenu.init()


  //////////////////////
  ///  USER PROFILE  ///
  //////////////////////

  UserInterests.init();
  UserSkills.init();
  UserReputation.init();
  EditProfile.init();
  DisplaySkillsForm.init();
  DisplayInterestsForm.init();

  //////////////////////
  ///    MAP PAGE    ///
  //////////////////////
  if ($('#map').length){
    MapFilter.init();

    //////////////////////
    ///  MAP BUILDER   ///
    //////////////////////

    // we need to pass default lon and lats in case we fail to set location
    var mapOpts = {
      startLatitude:   37.785128,
      startLongitude: -122.397308,
      initialZoom:     12,
      pageLocation:    'map'
    };

    var ourMap = new MapCreator(mapOpts).buildMap();

    var getUsersData_CLIENT = new AjaxClient('get', '/usersData.json');//add in proper path here
    var ourMarker = new MapMarker();

    var controllerOpts = {
      coolMap: ourMap,
      getUsersData_AJAX: getUsersData_CLIENT,
      coolMarker: ourMarker
    };

    var coolController = new MapController(controllerOpts);
    //////////////////////
    ///FIRE IN THE HOLE///
    //////////////////////
    coolController.initialize();
  }
});
