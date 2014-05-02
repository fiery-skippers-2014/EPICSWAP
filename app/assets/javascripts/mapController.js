function MapController(contOpts){
  this.COOL_MAP = contOpts.coolMap;
  this.getUsersData_AJAX = contOpts.getUsersData_AJAX;
};

MapController.prototype = {
  initialize: function(){
    this.getUsersInfoFromDB();
  },

  getUsersInfoFromDB: function(){
    console.log("about to send ajax request")
    this.getUsersData_AJAX.request().done(this._onGetUsersInfoSuccess.bind(this))
  },

  _onGetUsersInfoSuccess: function(data){
    console.log("we are in getUserInfoFromTheDB DATA BELOW ----------------")
    console.log(data)
    for(i = 0; i < data["users"].length ; i++){
      var lat = data.users[i].latitude;
      var long = data.users[i].longitude;
      this._createMarker(lat, long);
    }

  },

  _createMarker: function(latitude, longitude){
    L.marker([latitude, longitude]).addTo(this.COOL_MAP);
  },
};