function AjaxClient(method, action){
  this.method = method;
  this.action = action;
}

AjaxClient.prototype = {
  request: function(data){
    var response = $.ajax({
      type: this.method,
      url: this.action,
      data: data
    });
    return response;
  }
}