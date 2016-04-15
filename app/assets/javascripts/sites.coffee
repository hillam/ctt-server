# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@delete_noti = (id) ->
	if confirm('Are you sure?')
		jqxhr = $.post('/notifications/' + id)
		$('#noti_' + id).remove();
		if $('td').length < 1
			$('#noti_table').remove()
	return

@edit_noti = (id) ->
	# TODO
	return

$ ->
	$('.public').click ->
		jqxhr = $.post('/sites/' + $(this).attr('site'), {'public': this.checked})

	$('#table').dataTable
		'paging': 	true,
		'info': 	false,
		'searching':false
