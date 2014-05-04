function MapMarker(){}
MapMarker.prototype = {
  categoryART: function(latitude, longitude){
    var geoJsonData = {
      "type": "FeatureCollection",
      "features": [{ "type": "Feature",
          "geometry": {
              "type": "Point",
              "coordinates": [longitude, latitude]
          },
          "properties": {
              "title": "love", //$("[title=love]").hide()
              "description": "A description",
              "marker-size": "medium",
              "marker-symbol": "heart",
              "marker-color": "2963ba",
              "stroke": "#555555",
              "stroke-opacity": 1.0,
              "stroke-width": 2,
              "fill": "#555555",
              "fill-opacity": 0.5
          }
      }]
    };

    var geoJson = L.geoJson(geoJsonData, {
          pointToLayer: L.mapbox.marker.style,
          style: function(feature) { return feature.properties; }
    });

    return geoJson
  }
}