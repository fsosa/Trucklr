class Trucklr.Routers.Main extends Backbone.Router
	routes:
		'' : 'home'
		'map' : 'map'
		'profile' : 'show_truck'
		'trucks/:id': 'show_truck'

	initialize: ->
		@container = $('#main-container')

	home: ->
		if Trucklr.is_logged_in()
			@navigate('/profile', trigger: true)
		else
			view = new Trucklr.Views.HomeIndex()
			@container.html(view.render().el)

	map: ->
		console.log('map')

	show_truck: (id) ->
		@truck = new Trucklr.Models.Truck(id: id)
		@truck.urlRoot = '/api/trucks/profile' unless id
		view = new Trucklr.Views.TruckShow(el: @container, model: @truck, is_owner: !id?)
		@truck.fetch()