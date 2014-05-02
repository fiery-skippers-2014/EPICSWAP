$(document).ready(function(){
  var mapOpts = {
    startLatitude:   37.785128,
    startLongitude: -122.397308,
    initialZoom:     10
  };

  /////////////
  ///Instantiate Instances
  ////////////
  var coolMap = new MapFactory(mapOpts);
  coolMap.buildMap()



});




// $(document).ready(function(){



//   console.log("we are ready")
//   var map = L.map('map').setView([37.772943,-122.413015], 13);

// L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
//     attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
//     maxZoom: 18
// }).addTo(map);

// })