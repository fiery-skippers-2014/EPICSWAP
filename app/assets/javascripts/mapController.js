function MapController(contOpts){
  this.COOL_MAP = contOpts.coolMap;
  this.COOL_MARKER = contOpts.coolMarker;
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
    console.log("--------------_onGetUsersInfoSuccess")
    console.log(data)
    console.log("--------------_onGetUsersInfoSuccess")
    for(var i = 0, d = data["users"].length; i < d; i++){
      this._createMarkerByUser(data["users"][i]);
    };
    console.log("--------------_current_user in _onGetUsersInfoSuccess")
    console.log(data['current_user'])
    this._reCenterMap(data["current_user"].latitude, data["current_user"].longitude);
  },

  _createMarkerByUser: function(userData){
    console.log("--------------_userData in _createMarkerByUser")
    console.log(userData)
    console.log("--------------_userData[user] in _createMarkerByUser")
    console.log(userData['user'])
    var latitude        = this._shuffleValue(userData["user"].latitude);
    var longitude       = this._shuffleValue(userData["user"].longitude);
    var category        = userData['category'];
    console.log("--------------_userData[cate] in _createMarkerByUser")
    console.log(userData['category'])
    var html            = this._buildMustacheTemplate(userData);
    console.log("--------------html in _createMarkerByUser")
    console.log(html) //May run into an issue here of this taking too long to execute
    var currentMarker   = this._buildMarker(latitude, longitude, category);
    console.log("--------------html")
    console.log(html)
    console.log("--------------html")
    currentMarker.addTo(this.COOL_MAP)
                 .bindPopup(html)
                 .openPopup();
    $(currentMarker).click(function(){this._reCenterMap(latitude, longitude)}.bind(this));
    console.log('made it to the end of _createMarkerByUser')
  },

  _shuffleValue: function(coordinate){
    var decimalToManipulate = 100000;
    var random = Math.floor((Math.random() * 10));
    if (random > 5){
      var newCoord = random/decimalToManipulate + coordinate;
    }else{
      var newCoord = random/decimalToManipulate + coordinate;
    }
     return Math.round(newCoord * decimalToManipulate) / decimalToManipulate; 
  },

  _buildMustacheTemplate: function(userData){
    console.log('made it to _buildMustacheTemplate')
    var rawTemplate     = $("#userMarkerContentTemplate").html();
    console.log("--------------rawTemplate in _buildMustacheTemplate")
    console.log(userData[rawTemplate])
    var template        = Handlebars.compile(rawTemplate);
    console.log("--------------template in _buildMustacheTemplate")
    console.log(userData[template])
    var userMiniProfile = { profileImage: userData["user"].image,
                            userId: userData["user"].id,
                            Name: userData["user"].name,
                            Tagline: userData["user"].tagline,
                            skillList: userData["skills"]
                          };
    console.log("--------------userMiniProfile in _buildMustacheTemplate")
    console.log(userData[userMiniProfile])
    return template(userMiniProfile);
  },

  _buildMarker: function(latitude, longitude, category){
    console.log('we made it to _buildMarker')
    console.log('latitude below-------------------')
    console.log(latitude)
    console.log('longitude below-------------------')
    console.log(longitude)
    console.log('category below-------------------')
    console.log(category)
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
    console.log('we made it out of _buildMarker')
  },

  _reCenterMap: function(latitude, longitude){
    this.COOL_MAP.panTo(new L.LatLng(latitude, longitude));
  }

};