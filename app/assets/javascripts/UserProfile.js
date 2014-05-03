var UserInterests = {
  init: function(){
    $('form.new_interest').on('ajax:success', this.appendInterest )
    $('form.new_interest').on('ajax:error', this.appendError )
  },

  appendInterest: function(e, data){
    console.log(data)
    $('ul.my-interests').append(data)
  },

  appendError: function(e, data){
    console.log(data);
  }
}


var UserSkills = {
  init: function(){
    $('form.new_skill').on('ajax:success', this.appendSkill )
    $('form.new_skill').on('ajax:error', this.appendError )
  },

  appendSkill: function(e, data){
    console.log('success')
    $('ul.my-skills').append(data)
  },

  appendError: function(e, data){
    console.log('fail');
  }
}
