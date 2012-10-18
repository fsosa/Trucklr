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
	auth_token: null
	login: (auth_token) ->
		@auth_token = auth_token
		$(document).ajaxSend (e, xhr, options) ->
			xhr.setRequestHeader("authentication_token", auth_token)
		Trucklr.router.navigate('/profile', trigger: true)


	logout: () ->
		@auth_token = null
		$(document).ajaxSend (e, xhr, options) ->
			xhr.setRequestHeader("authentication_token", '')
		Trucklr.router.navigate('/', trigger: true)


	is_logged_in: () ->
		@auth_token == null

$(document).ready ->
	Trucklr.init()