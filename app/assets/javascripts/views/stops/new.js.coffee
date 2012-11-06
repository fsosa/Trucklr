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

		@autocomplete = new google.maps.places.Autocomplete(@$('[name="formatted_address"]')[0], types: ['geocode'])
		google.maps.event.addListener @autocomplete, "place_changed", =>
			place = @autocomplete.getPlace()
			return unless place and place.geometry
			@model.set
				location: place.formatted_address
				latitude: place.geometry.location.lat()
				longitude: place.geometry.location.lng()

		if !Modernizr.touch
			$('.datepicker').datepicker
		    	format: "mm/d"
			    weekStart: 1
			    autoclose: true
			    startDate: new Date()
			    todayBtn: true
		    $('.timepicker').timepicker
		    	defaultTime: 'value'

		
		bindings =
			start_time:
				selector: '.starttime'
				converter: (direction, value, attribute, model) ->
					console.log direction, value, attribute, model


		@modelBinder.bind(@model, @el)
		@

	saveClicked: (event) ->
		event.preventDefault()
		#@model.validate

		console.log 'saving'
		console.log @model
		@model.save {},
			success: =>
				@model.get('truck').get('stops').add(@model)
				@close()
			error: =>
				console.log 'failure'