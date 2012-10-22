class Trucklr.Views.TruckShow extends Backbone.View

	template: JST['trucks/show']

	events:
		'click #new-stop' : 'newStop'

	initialize: () ->
		@model.on('change', @render, this)
		@stopsView = new Trucklr.Views.StopsCollectionView
			model: @model.get('stops')
			is_owner: @options.is_owner

	render: ->
		$(@el).html(@template(truck: @model, is_owner: @options.is_owner))
		@renderStops()
		this

	renderStops: ->
		@stopsView.el = @$('#stops_list')
		@stopsView.render()

	newStop: (event) ->
		event.preventDefault()
		stop = new Trucklr.Models.Stop()
		new Trucklr.Views.NewStop(model: stop).render()