function MapCreator(mapOpts){
  this.START_LATITUDE  = mapOpts.startLatitude;
  this.START_LONGITUDE = mapOpts.startLongitude;
  this.INITIAL_ZOOM    = mapOpts.initialZoom;
  this.PAGE_LOCATION   = mapOpts.pageLocation;
}

MapCreator.prototype = {
  buildMap: function(){
    return this.buildMapBox_MAP();
    // return this.buildOSM_Map();
  },

  buildMapBox_MAP: function(){
    var map = L.mapbox.map('map', 'nathansass.i6aj2d20', {infoControl: false})
                      .setView(L.latLng(this.START_LATITUDE, this.START_LONGITUDE),
                      this.INITIAL_ZOOM);
    return map
  },

  buildOSM_Map: function(){ //CALL WITH return this.buildOSM_MAP()
    var lMap = new L.map(this.PAGE_LOCATION);
    lMap.setView(L.latLng(this.START_LATITUDE, this.START_LONGITUDE), this.INITIAL_ZOOM);
    return this._initializeOSM(lMap);
  },

  _initializeOSM: function(map){
    var osmURL  = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
    var osmAttr = 'Map data © <a href="http://openstreetmap.org">OpenStreetMap</a> contributors ';
    var layer   = new L.TileLayer(osmURL, {minZoom: 2, maxZoom: 18, attribution: osmAttr});
    return map.addLayer(layer);
  }

};