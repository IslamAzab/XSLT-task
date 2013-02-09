// Adding URLs properly
$(function setURLs () {
  $(".urls").each(function(){
    $(this).attr('href',$(this).html())
  })
});

// Adding padding to body to avoid being covered by the nav-bar
$(function setBodyPadding () {
  var padding = 10 + $("#top-bar").height();
  $("body").css('padding',padding)
});

function toggleElement(element)
{
  $(element).parent().next().slideToggle();
}
function expandAll()
{
  $(".row-fluid.results").slideDown();
}
function collapseAll()
{
  $(".row-fluid.results").slideUp();
}