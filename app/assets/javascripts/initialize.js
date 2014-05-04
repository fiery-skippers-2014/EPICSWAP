$(document).ready(function(){

  //////////////////////
  ///  USER PROFILE  ///
  //////////////////////

  UserInterests.init();
  UserSkills.init();
  UserReputation.init();
  EditProfile.init();

  //////////////////////
  ///  MAP BUILDER   ///
  //////////////////////
  if ($('#map').length){
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