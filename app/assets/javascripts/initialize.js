$(document).ready(function(){
  var mapOpts = {
    startLatitude:   37.785128,
    startLongitude: -122.397308,
    initialZoom:     12
  };

  var controllerOpts = {
    coolMap: new MapFactory(mapOpts)
  };

  /////////////
  ///Instantiate Instances
  ////////////

  var coolController = new MapController(controllerOpts)
  coolController.initialize();
});