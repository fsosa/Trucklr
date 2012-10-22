class Trucklr.Views.ModalView extends Backbone.View

	template: JST['base/modal']

	events:
		'click #save-button' : 'saveClicked'

	render: (options) ->
		$(@el).html(@template(options))
		modalEl = $('#modal-container')
		modalEl.html(@el)
		modalEl.modal()
		@

	saveClicked: (event) ->
		throw 'not implemented'