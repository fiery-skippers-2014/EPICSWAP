function MapController(contOpts){
  this.COOL_MAP          = contOpts.coolMap;
  this.COOL_MARKER       = contOpts.coolMarker;
  this.getUsersData_AJAX = contOpts.getUsersData_AJAX;
};

MapController.prototype = {
  initialize: function(){
    this.getUsersInfoFromDB();
  },

  getUsersInfoFromDB: function(){
    this.getUsersData_AJAX.request().done(this._onGetUsersInfoSuccess.bind(this));
  },

  _onGetUsersInfoSuccess: function(data){
    for(var i = 0, d = data["users"].length; i < d; i++){
      this._createMarkerByUser(data["users"][i]);
    };
    this._reCenterMap(data["current_user"].latitude, data["current_user"].longitude);
  },

  _createMarkerByUser: function(userData){
    var latitude        = this._shuffleValue(userData["user"].latitude);
    var longitude       = this._shuffleValue(userData["user"].longitude);
    var category        = userData['category'];
    var html            = this._buildMustacheTemplate(userData);
    var currentMarker   = this._buildMarker(latitude, longitude, category);
    currentMarker.addTo(this.COOL_MAP)
                 .bindPopup(html)
                 .openPopup();
    $(currentMarker).click(function(){this._reCenterMap(latitude, longitude)}.bind(this));
  },

  _shuffleValue: function(coordinate){
    var decimalToManipulate = 1000000;
    var random = Math.floor((Math.random() * 10));
    if (random > 5){
      var newCoord = random/decimalToManipulate + coordinate;
    }else{
      var newCoord = random/decimalToManipulate - coordinate;
    }
     return Math.round(newCoord * decimalToManipulate) / decimalToManipulate; 
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
  },

  _buildMarker: function(latitude, longitude, category){
    if(category == "language"){
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "airport", "BA29B5");

    }else if(category == "sport"){
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "skiing", "f39c12");

    }else if(category == "finance"){
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "bank", "2ecc71");

    }else if(category == "arts"){
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "art-gallery", "9b59b6");

    }else if(category == "fitness"){
       return this.COOL_MARKER.styleMarker(latitude, longitude, category, "pitch", "e74c3c");

    }else if(category == "technology"){
       return this.COOL_MARKER.styleMarker(latitude, longitude, category, "chemist", "516fd2");

    }else{
      return this.COOL_MARKER.styleMarker(latitude, longitude, 'other', "heart", "34495e");
    }
  },

  _reCenterMap: function(latitude, longitude){
    this.COOL_MAP.panTo(new L.LatLng(latitude, longitude));
  }
};