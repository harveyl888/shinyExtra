$(document)
  /* collapsible panel */
  .on('click', '.panel-heading span.clickable', function(e){  /* toggle collapse state on click */
    $(this).parents('.panel').find('.panel-collapse').collapse('toggle');
  })
  .on('show.bs.collapse', '.panel-collapse', function () {  /* collapsed state - change icon to up */
    var $span = $(this).parents('.panel').find('.panel-heading span.clickable');
    $span.find('.icon-collapse').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
  })
  .on('hide.bs.collapse', '.panel-collapse', function () {  /* uncollapsed state - change icon to down */
    var $span = $(this).parents('.panel').find('.panel-heading span.clickable');
    $span.find('.icon-collapse').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
  });
