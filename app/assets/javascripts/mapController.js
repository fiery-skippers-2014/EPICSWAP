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
    this.getUsersData_AJAX.request().done(this._onGetUsersInfoSuccess.bind(this))
  },

  _onGetUsersInfoSuccess: function(data){
    for(var i = 0, d = data["users"].length; i < d; i++){
      this._createMarkerForUser(data["users"][i]);
    }
    this._reCenterMap(40.737, -73.923);
  },

  _createMarkerForUser: function(userData){
    var category        = userData['category']
    var html            = this._buildMustacheTemplate(userData); //May run into an issue here of this taking too long to execute
    var currentMarker   = this._buildMarker(userData["user"].latitude, userData["user"].longitude, category);
    currentMarker.addTo(this.COOL_MAP)
                 .bindPopup(html)
                 .openPopup();
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
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "skiing", "17750D");

    }else if(category == "dance"){
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "pitch", "0C0A45");

    }else if(category == "art"){
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "art-gallery", "75391B");

    }else if(category == "cooking"){
      return this.COOL_MARKER.styleMarker(latitude, longitude, category, "fast-food", "72751B");

    }else if(category == "fitness"){
       return this.COOL_MARKER.styleMarker(latitude, longitude, category, "school", "A8236F");

    }else if(category == "technology"){
       return this.COOL_MARKER.styleMarker(latitude, longitude, category, "chemist", "6150B3");

    }else{
      return this.COOL_MARKER.categoryDEFAULT(latitude, longitude, category, "heart", "548F79");
    }
  },

  _reCenterMap: function(latitude, longitude){
    this.COOL_MAP.panTo(new L.LatLng(latitude, longitude));

  }

};