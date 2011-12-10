// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
    
  var sliderMax = $("#slider").attr("data-max");    
  $("#slider").slider({
    min: sliderMax - 95,
    max: sliderMax,
    value: sliderMax,
    step: 1, 
    stop: function(event, ui){
      sliderVal = ui.value;
      
      var handleLeft = $(".ui-slider-handle").offset().left;      
     
      $.get("/timelapse/" + sliderVal + ".json", function(data){
        $("#currentDate").text(data.timestamp).css({left: handleLeft - 35});

        $("#links").empty();
        $(data.links).each(function(){
          $("#links").append("<div class='link'><div class='rank'>" + this.link.rank + "</div><a class='title' href='" + this.link.href + "'>" + this.link.title + "</a><a class='comments' href='" + this.link.comments + "'>Comments</a></div>")
        });
      });
    }
  });
  
});