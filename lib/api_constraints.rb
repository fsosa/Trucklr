class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
    @header = header(@version)
  end

  def header(version)
  	"application/vnd.trucklr.v#{version}"
  end

  def matches?(req)
    @default || req.headers['Accept'].include?(@header)
  end
end