class Trucklr.Views.HomeIndex extends Backbone.View

	template: JST['home/index']

	events:
		'click #show-map-button' : 'showMap'

	render: ->
		$(@el).html(@template())
		this

	showMap: (event) ->
		event.preventDefault()
		Trucklr.router.navigate("map", trigger: true)