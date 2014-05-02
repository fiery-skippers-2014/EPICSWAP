function MapController(contOpts){
  this.COOL_MAP = contOpts.coolMap;
};

MapController.prototype = {
  initialize: function(){
    this.COOL_MAP.buildMap();
  }
};