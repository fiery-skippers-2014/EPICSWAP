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
    var category        = userData['category']
    var currentMarker   = this._buildMarker(userData["user"].latitude, userData["user"].longitude, category);
    var html            = this._buildMustacheTemplate(userData);
    currentMarker.bindPopup(html).openPopup();
  },

  _buildMarker: function(latitude, longitude, category){
    var iconForCategory = _iconByCategory(category)
    return L.marker([latitude, longitude], { icon: iconForCategory }).addTo(this.COOL_MAP); //location to add icon parameters, possible default icon
  },

  _iconByCategory: function(category){
    if (category == "art"){
      var artIcon = new MapMarker({iconUrl: })

    }
    else if (category == "cooking"){

    }else if(category == "sports"){

    }else{
      // default here
    }
  },


  _iconBaseClass: function(){
    var CategoryIcon = L.Icon.extend({
      options: {
          shadowUrl: 'leaf-shadow.png',
          iconSize:     [38, 95],
          shadowSize:   [50, 64],
          iconAnchor:   [22, 94],
          shadowAnchor: [4, 62],
          popupAnchor:  [-3, -76]
      }
    });
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
  }

};