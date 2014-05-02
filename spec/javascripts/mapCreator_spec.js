//////////////////////
///// MAP CREATOR ////
//////////////////////
describe("MapCreator", function(){
  it("is defined", function(){
    expect(MapCreator).toBeDefined()
  });
})

//////////////////////
///// CONTROLLER /////
//////////////////////

describe("MapController", function(){
  beforeEach(function(){
    this.COOL_MAP = true

    $("<div id='map style='display:none'></div").appendTo("body")
  })

  afterEach(function(){
    $("#map").remove();
  });

  it("is defined", function(){
    expect(MapController).toBeDefined()
  });

  it("has a map", function(){
    expect(this.COOL_MAP).toBeTruthy()
  })
})