var UserReputation = {
  init: function(){
    $('form.new_reputation').on('ajax:success', this.appendReputation )
    $('form.new_reputation').on('ajax:error', this.appendError )
  },
  appendReputation: function(e, data){
    $('form.new_reputation').hide();
    $('p#user-reputation').html(data.score)
  },

  appendError: function(e, data){
    console.log('fail');
  }
}