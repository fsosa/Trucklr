class Trucklr.Views.StopsCollectionView extends Backbone.View

	template: JST['stops/collection']
	
	render: ->
		$(@el).html(@template(stops: @model))
		this