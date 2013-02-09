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