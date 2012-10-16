window.Trucklr =
	Models: {}
	Collections: {}
	Routers: {}
	Views: {}
	init: () ->
		Trucklr.router = new Trucklr.Routers.Main()
		Backbone.history.start(pushState: true)


$(document).ready ->
	Trucklr.init()
