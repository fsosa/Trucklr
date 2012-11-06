class Trucklr.Models.Truck extends Backbone.RelationalModel
	urlRoot: '/api/trucks'
	idAttribute: 'id'
	relations: [
		type: Backbone.HasMany,
		key: 'stops',
		relatedModel: 'Trucklr.Models.Stop'
	]

Trucklr.Models.Truck.setup()