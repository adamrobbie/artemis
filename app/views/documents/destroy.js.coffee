$('#<%= dom_id(@document) %>')
  .fadeOut ->
  	$(this).remove()