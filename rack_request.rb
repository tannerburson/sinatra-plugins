require 'rack/request'

module Rack
  class Request
	def subdomains
	  @env['rack.env.subdomains'] ||= lambda {
		return [] if (host.nil? || 
					  /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/.match(host))
		host.split('.')[0...-2]
	  }.call
	end
  end
end
