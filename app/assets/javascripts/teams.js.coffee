# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  id_equipement = ''
  nb_points = ''

	$('.draggable').draggable
		snap: '.droppable',
		revert: true,
		drag: (event, ui) ->
      $(this).addClass 'is-dragged'
      id_equipement = $(this).attr("data-equipment-id")
      nb_points = $(this).attr('data-equipment-points')
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
      gladiator_points = $(this).attr('data-gladiator-point')
      alert 'vous avez trop de points' if gladiator_points+nb_points > 10
			$(this).find($('.gladiator-equipments')).append(toClone)
			$.ajax(
				type: "POST"
				url: $(this).attr('data-url')
				data:
					id_equipement: id_equipement
					id_gladiateur: id_gladiateur
			)
