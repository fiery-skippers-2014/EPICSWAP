$(document).ready(function(){
  var mapOpts = {
    startLatitude:   37.785128,
    startLongitude: -122.397308,
    initialZoom:     12,
    pageLocation:    'map'
  };

  var ourMap = new MapCreator(mapOpts).buildMap()


  var retrieveUserData_CLIENT = new AjaxClient('get', '')//add in proper path here

  var controllerOpts = {
    coolMap: ourMap,
    getUserData_AJAX: getUserData_CLIENT
  };


  var coolController = new MapController(controllerOpts)
  //////////////////////
  ///FIRE IT UP BELOW///
  //////////////////////
  coolController.initialize();
});