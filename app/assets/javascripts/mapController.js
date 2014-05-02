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
    var currentMarker   = this._addLocation(userData.latitude, userData.longitude);
    var html            = this._buildMustacheTemplate(userData);
    currentMarker.bindPopup(html).openPopup();
  },

  _addLocation: function(latitude, longitude){
    return L.marker([latitude, longitude]).addTo(this.COOL_MAP);
  },

  _buildMustacheTemplate: function(userData){
    var rawTemplate     = $("#userMarkerContentTemplate").html();
    var template        = Handlebars.compile(rawTemplate);
    var userMiniProfile = { Name: userData.name, Tagline: userData.tagline };
    return template(userMiniProfile);
  }
};