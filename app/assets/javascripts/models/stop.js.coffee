class Trucklr.Models.Stop extends Backbone.RelationalModel
	urlRoot: '/api/stops'
	idAttribute: 'id'
	defaults:
		#date: moment().format('YYYY-MM-DD')
		start_time: moment().add('hours', 1).startOf('hour')#.format('YYYY-MM-DD h:mm A')
		end_time: moment().add('hours', 2).startOf('hour')#.format('h:mm A')

	save: (attributes, options) =>
		@set('truck_id', @get('truck').get('id'))
		super attributes, options

Trucklr.Models.Stop.setup()