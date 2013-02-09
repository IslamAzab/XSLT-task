// Adding URLs properly
$(function setURLs () {
  $(".urls").each(function(){
    $(this).attr('href',$(this).html())
  })
});

function toggleElement(element)
{
  $(element).next().next().slideToggle();
}
function expandAll()
{
  $("div.results").slideDown();
}
function collapseAll()
{
  $("div.results").slideUp();
}