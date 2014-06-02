// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

var documentReady;
documentReady = function(){
  // Clickable table rows.
  // Set the class 'table-clickable' in table and
  // in tr set 'data-link' and (optional) 'data-target'
  $('table.table-clickable').each(function(index, table){
    $(table).find('tbody tr').each(function(index, trow){
      $(trow).click(function(evnt){
        var link = $(this).attr('data-link');
        var target = $(this).attr('data-target');

        if( !target ){ target = '_self'; }
        if( link ){ window.open(link, target); }
      });
    });
  });

  // Clear forms
  $('.q-reset').click(function(evnt){
    $(".search-field").val('')
  });

  // Datetimepickers
  $('[data-behaviour~=datepicker]').datetimepicker({
    sideBySide: false
  });
};

$(document).ready(documentReady);
$(document).on('page:load', documentReady);

