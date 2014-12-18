# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

	id_equipement = ''
	gladiator_id  = ''

	$('.draggable').draggable
		snap: '.droppable',
		revert: true,
		drag: (event, ui) ->
			$(this).addClass 'is-dragged'
			id_equipement = $(this).attr("data-equipment-id")

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
			id_gladiateur = $(this).attr('data-id-gladiator')
			$(this).find($('.gladiator-equipments')).append(toClone)
			$.ajax(
				type: "POST"
				url: $(this).attr('data-url')
				data:
					id_equipement: id_equipement
					id_gladiateur: id_gladiateur
			)


	$('.draggable-index').draggable
		snap: '.droppable',
		revert: true,
		drag: (event, ui) ->
			gladiator_id = $('.draggable-index').attr('data-gladiator-id')

	$('.droppable-index').droppable
		drop: (event, ui) ->
			team_id = $(this).attr('data-team-id')
			$.ajax(
				type: "POST"
				url: $(this).attr('data-url')
				data:
					team_id: team_id
					gladiator_id: gladiator_id
			)
