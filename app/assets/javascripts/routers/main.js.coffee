class Trucklr.Routers.Main extends Backbone.Router
	routes:
		'' : 'home'
		'map' : 'map'
		'profile' : 'profile'

	initialize: ->
#		@collection = new Paleomaps.Collections.Places()
#		@mapView = new Paleomaps.Views.Map()
		@container = $('#main-container')

	home: ->
		view = new Trucklr.Views.HomeIndex()
		@container.html(view.render().el)

	map: ->
		console.log('map')

	profile: ->
		@truck = new Trucklr.Models.Truck
		@truck.urlRoot = '/api/trucks/profile'
		@truck.fetch()
		view = new Trucklr.Views.TruckShow(model: @truck, is_owner: true)
		view.is_owner = true
		@container.html(view.render().el)
#	newPlace: ->
#		view = new Paleomaps.Views.PlacesNew
#			mapView: @mapView
#			collection: @collection
#		@menu.html(view.render().el)
#
#	show: (id) ->
#		@model = @collection.get(id)
#		unless @model?
#			@model = new Paleomaps.Models.Place(id: id)
#		@model.fetch()
#		view = new Paleomaps.Views.PlacesShow(model: @model)
#		@menu.html(view.render().el)