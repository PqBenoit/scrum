$(document).on 'ready page:load', ->

	id_equipement = ''
	points_equipement = ''
	gladiator_id  = ''

	$('.draggable').draggable
		snap: '.droppable',
		revert: true,
		drag: (event, ui) ->
			$(this).addClass 'is-dragged'
			id_equipement = $(this).attr("data-equipment-id")
			points_equipement = $(this).attr('data-equipment-points')
		stop: (event, ui) ->
			$(this).removeClass 'is-dragged'

	$('.droppable').droppable
		drop: (event, ui) ->
			$(this).addClass 'item-added'
			setTimeout ( ->
				$('.item-added').removeClass('item-added')
			), 500
			toClone = '<li>' + $('.is-dragged').find('h3').text() + '</li>'
			id_gladiateur = $(this).attr('data-id-gladiator')

			points_gladiateur = (if $(this).attr("data-gladiator-points") > 0 then $(this).attr("data-gladiator-points") else 0)
			if (parseInt(points_gladiateur)+parseInt(points_equipement)) > 10
				alert "En ajoutant cette équipement, votre gladiateur dépasse la limite des 10 points !"
				return

			$(this).find($('.gladiator-equipments')).append(toClone)
			$.ajax(
				type: "POST"
				url: $(this).attr('data-url')
				data:
					id_equipement: id_equipement
					id_gladiateur: id_gladiateur
					points_equipement: points_equipement
			)

		$('.draggable-index').draggable
				snap: '.droppable'


	$('.draggable-index').draggable
		snap: '.droppable',
		revert: true,
		drag: (event, ui) ->
			gladiator_id = $(this).attr('data-gladiator-id')

		$('.droppable-index').droppable
				hoverClass: 'team-drop'
				drop: (event, ui) ->
						team_id = $(this).attr('data-team-id')
						$.ajax(
								type: "POST"
								url: $(this).attr('data-url')
								data:
										team_id: team_id
										gladiator_id: gladiator_id
						)
