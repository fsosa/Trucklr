class Trucklr.Views.TruckShow extends Backbone.View

	template: JST['trucks/show']

	initialize: ->
		@model.on('change', @render, this)
		@is_owner = false

	render: ->
		$(@el).html(@template(truck: @model, is_owner: @is_owner))
		this