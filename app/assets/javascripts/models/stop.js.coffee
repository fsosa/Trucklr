class Trucklr.Models.Stop extends Backbone.RelationalModel
	urlRoot: '/api/stops'
	idAttribute: 'id'

	defaults:
		date: moment().format('YYYY-MM-DD')
		start_time: moment().add('hours', 1).startOf('hour').format('h:mm A')
		end_time: moment().add('hours', 2).startOf('hour').format('h:mm A')

Trucklr.Models.Stop.setup()