function AjaxClient(method, action){
  this.method = method;
  this.action = action;
}

AjaxClient.prototype = {
  request: function(){
    var response = $.ajax({
      type: this.method,
      url: this.action
    });
    return response;
  }
}