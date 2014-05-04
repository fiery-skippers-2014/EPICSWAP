function MapController(contOpts){
  this.COOL_MAP = contOpts.coolMap;
  this.getUsersData_AJAX = contOpts.getUsersData_AJAX;
};

MapController.prototype = {
  initialize: function(){
    this.getUsersInfoFromDB();
  },

  getUsersInfoFromDB: function(){
    this.getUsersData_AJAX.request().done(this._onGetUsersInfoSuccess.bind(this))
  },

  _onGetUsersInfoSuccess: function(data){
    for(var i = 0, d = data["users"].length; i < d; i++){
      this._createMarkerForUser(data["users"][i]);
    }
  },

  _createMarkerForUser: function(userData){
    var category        = userData['category']
    var currentMarker   = this._buildMarker(userData["user"].latitude, userData["user"].longitude, category);
    currentMarker.addTo(this.COOL_MAP).bindPopup("<p>hi</p>").openPopup();
    // var html            = this._buildMustacheTemplate(userData);
    // currentMarker.bindPopup(html).openPopup();
  },

  _buildMarker: function(latitude, longitude, category){
    var geoJsonData = {
    "type": "FeatureCollection",
    "features": [{ "type": "Feature",
        "geometry": {
            "type": "Point",
            "coordinates": [longitude, latitude]
        },
        "properties": {
            "title": "love", //$("[title=love]").hide()
            "description": "A description",
            "marker-size": "medium",
            "marker-symbol": "heart",
            "marker-color": "2963ba",
            "stroke": "#555555",
            "stroke-opacity": 1.0,
            "stroke-width": 2,
            "fill": "#555555",
            "fill-opacity": 0.5,
            "className": "awesome"
        }
    }]
};

    // Here we use the `L.geoJson` layer type from Leaflet, that lets us use
    // Polygons, Points, and all other GeoJSON types - but we specify that it
    // should also pull styles for polygons with the `style` option
    // and use the custom `L.mapbox.marker.style` function
    // to make fancy markers with the `pointToLayer` option.
    // var geoJson = L.geoJson(geoJsonData, {
    //     pointToLayer: L.mapbox.marker.style,
    //     style: function(feature) { return feature.properties; }
    // }).addTo(this.COOL_MAP)

  var geoJson = L.geoJson(geoJsonData, {
        pointToLayer: L.mapbox.marker.style,
        style: function(feature) { return feature.properties; }
    });
  return geoJson

  },

  // _buildMarker: function(latitude, longitude, category){
  //   var myIcon = L.icon({
  //     iconUrl: '/assets/sample_icon.png',
  //     // iconRetinaUrl: 'my-icon@2x.png',
  //     iconSize: [38, 50],
  //     iconAnchor: [22, 94],
  //     popupAnchor: [-3, -76],
  //     // shadowUrl: 'sample_icon',
  //     // shadowRetinaUrl: 'my-icon-shadow@2x.png',
  //     shadowSize: [68, 95],
  //     shadowAnchor: [22, 94],
  //     className: "coolMarkers"
  //   });

  //   return L.marker([latitude, longitude],{icon: myIcon}).addTo(this.COOL_MAP); //location to add icon parameters, possible default icon
  // },

  _buildMustacheTemplate: function(userData){
    var rawTemplate     = $("#userMarkerContentTemplate").html();
    var template        = Handlebars.compile(rawTemplate);
    var userMiniProfile = { profileImage: userData["user"].image,
                            userId: userData["user"].id,
                            Name: userData["user"].name,
                            Tagline: userData["user"].tagline,
                            skillList: userData["skills"]
                          };
    return template(userMiniProfile);
  }

};