class Trucklr.Views.NewStop extends Trucklr.Views.ModalView

	subTemplate: JST['stops/new']

	initialize: ->
		super
		@modelBinder = new Backbone.ModelBinder()

	render: ->
		super
			title: "New Stop"
			content: @subTemplate()
			saveLabel: "Schedule my Stop!"

		@autocomplete = new google.maps.places.Autocomplete(@$('[name="location"]')[0], types: ['geocode'])

		if (!Modernizr.inputtypes.date)
			$('.datepicker').datepicker
		    	format: "mm/d"
			    weekStart: 1
			    autoclose: true
			    startDate: new Date()
			    todayBtn: true

		if (!Modernizr.inputtypes.time)
		    $('.timepicker').timepicker
		    	defaultTime: 'value'
		
		@modelBinder.bind(@model, @el)
		@

	saveClicked: (event) ->
		event.preventDefault()
		place = @autocomplete.getPlace()
		if place?
			@model.set
				location: place.formatted_address
				latitude: place.geometry.location.Xa
				longitude: place.geometry.location.Ya
		#@model.validate

		console.log 'saving'
		console.log @model