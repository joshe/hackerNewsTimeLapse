// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
  
  $("#mainSlider").change(function(){
    sliderVal = $(this).val();
    $.get("/timelapse/" + sliderVal + ".json", function(data){
      $("#currentDate").text(data.timestamp);
      
      $("#links").empty();
      $(data.links).each(function(){
        $("#links").append("<tr><td class='title'>" + this.link.rank + "</td><td class='title'><a href='" + this.link.href + "'>" + this.link.title + "</a></td><td><a href='" + this.link.comments + "'>Comments</a></td></tr>")
      });
    });
  });
});