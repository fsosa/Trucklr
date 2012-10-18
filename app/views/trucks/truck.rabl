attributes :id, :description, :name

child :stops do
	extends 'api/v1/stops/stop'
end