function MapCreator(mapOpts){
  this.START_LATITUDE  = mapOpts.startLatitude;
  this.START_LONGITUDE = mapOpts.startLongitude;
  this.INITIAL_ZOOM    = mapOpts.initialZoom;
  this.PAGE_LOCATION   = mapOpts.pageLocation;
}

MapCreator.prototype = {
  buildMap: function(){
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