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
    var html            = this._buildMustacheTemplate(userData); //May run into an issue here of this taking too long to execute
    var currentMarker   = this._buildMarker(userData["user"].latitude, userData["user"].longitude, category);
    currentMarker.addTo(this.COOL_MAP)
                 .bindPopup(html)
                 .openPopup();
  },

  _buildMarker: function(latitude, longitude, category){
    var CoolMarker = new MapMarker()
    return CoolMarker.categoryART(latitude, longitude)
    // var geoJsonData = {
    //   "type": "FeatureCollection",
    //   "features": [{ "type": "Feature",
    //       "geometry": {
    //           "type": "Point",
    //           "coordinates": [longitude, latitude]
    //       },
    //       "properties": {
    //           "title": "love", //$("[title=love]").hide()
    //           "description": "A description",
    //           "marker-size": "medium",
    //           "marker-symbol": "heart",
    //           "marker-color": "2963ba",
    //           "stroke": "#555555",
    //           "stroke-opacity": 1.0,
    //           "stroke-width": 2,
    //           "fill": "#555555",
    //           "fill-opacity": 0.5
    //       }
    //   }]
    // };

    // var geoJson = L.geoJson(geoJsonData, {
    //       pointToLayer: L.mapbox.marker.style,
    //       style: function(feature) { return feature.properties; }
    // });

    // return geoJson
  },

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