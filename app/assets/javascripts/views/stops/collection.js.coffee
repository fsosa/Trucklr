class Trucklr.Views.StopsCollectionView extends Backbone.View

	template: JST['stops/collection']
	
	render: ->
		console.log @model
		$(@el).html(@template(stops: @model))
		this