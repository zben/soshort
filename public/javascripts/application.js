// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $("'[placeholder]'").focus(function() {
    var input = $(this);
    if (input.val() == input.attr("'placeholder'")) {
      input.val("''");
      input.removeClass("'placeholder'");
    }
  }).blur(function() {
    var input = $(this);
    if (input.val() == "''" || input.val() == input.attr("'placeholder'")) {
      input.addClass("'placeholder'");
      input.val(input.attr("'placeholder'"));
    }
  }).blur();




});
