$('#household-form-typeahead').click(function() {
    $(this).val("")
});

if(typeof autocomplete_items != 'undefined') {
  $('#household-form-typeahead').typeahead({
    source: autocomplete_items,
    updater: function(item) {
      $('#household-form-id').val(household_matrix[item]);
      return item;
    },
	items: 20
  });  
}

$('#household-form').submit(function() {
  id = $(this).find('#household-form-id').val();
  url = window.location.pathname + '/' + id;
  $(this).attr('action', url);
  window.location = url;
  return false;
});
