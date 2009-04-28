require 'sinatra/base'

module Sinatra
  module NestedLayouts
	module Helpers

	  def erb_nested_layout(page,options={})
		layout_path =  begin
		  (class<<self;self;end).layout_name
		rescue NoMethodError
		  options[:layout]
		end
		unless layout_path
		  layout_path = '../layout'
		end
		if options[:layout] != false
		  options.merge!(:layout => layout_path.to_sym)
		end
		old_erb page, options
	  end

	end

	def self.registered(app)
	  # alias the new erb helper
	  app.helpers NestedLayouts::Helpers
	  app.send(:alias_method,:old_erb, :erb)
	  app.send(:alias_method,:erb, :erb_nested_layout)
	end
  end
end
