var UserReputation = {
  init: function(){
    $('a.new_reputation').on('ajax:success', this.appendReputation )
    $('a.new_reputation').on('ajax:error', this.appendError )
  },
  appendReputation: function(e, data){
    $('a.new_reputation').hide();
    $('#user-reputation').html(data.score);
  },

  appendError: function(e, data){
    console.log('fail');
  }
}