function MapController(contOpts){
  this.COOL_MAP = contOpts.coolMap;
  this.getUserData_AJAX = contOpts.getUserData_AJAX;
};

MapController.prototype = {
  initialize: function(){
    this.getUserInfoFromTheDB;
  },

  getUserInfoFromTheDB: function(){
    this.getUserData_AJAX.request().done(this.onGetUserInfoSuccess.bind(this))
  },

  _onGetUserInfoSuccess: function(data){
    console.log("we are in getUserInfoFromTheDB DATA BELOW ----------------")
    console.log(data)
  },

  _createMarker: function(){
    L.marker([37.785128, -122.397308]).addTo(this.COOL_MAP);
  },
};