class Trucklr.Views.TruckShow extends Backbone.View

	template: JST['trucks/show']

	initialize: () ->
		@model.on('change', @render, this)
		#@model.on('add:stops', @renderStops, this);
		@stopsView = new Trucklr.Views.StopsCollectionView
			model: @model.get('stops')
			is_owner: @options.is_owner

	render: ->
		console.log 'rendering'
		$(@el).html(@template(truck: @model, is_owner: @options.is_owner))
		@renderStops()
		this

	renderStops: ->
		@stopsView.el = @$('#stops_list')
		@stopsView.render()