Backbone.old_sync = Backbone.sync
Backbone.sync = (method, model, options) ->
	options.beforeSend = (xhr) ->
		token = $('meta[name="csrf-token"]').attr('content')
		xhr.setRequestHeader('X-CSRF-Token', token) if token
	Backbone.old_sync(method, model, options)


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
