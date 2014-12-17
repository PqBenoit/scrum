# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	console.log 'hello'

	$('.draggable').draggable
		snap: '.droppable',
		revert: true,
		drag: (event, ui) ->
			$(this).addClass 'is-dragged'

		stop: (event, ui) ->
			$(this).removeClass 'is-dragged'

	$('.droppable').droppable
		hoverClass: 'green drop-hover-class',
		drop: (event, ui) ->
			$(this).addClass 'item-added'
			setTimeout ( ->
				$('.item-added').removeClass('item-added')
			), 500
			toClone = '<li>' + $('.is-dragged').find('h3').text() + '</li>'
			$(this).find($('.gladiator-equipments')).append(toClone)
			