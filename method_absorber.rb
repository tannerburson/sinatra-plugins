require 'sinatra/base'

module Sinatra
  module MethodAbsorber
	class Absorber
	  instance_methods.each { |m| undef_method m unless m =~ /^__/ }
	  def method_missing(*args)
		''
	  end
	end

	def e(obj)
	  obj || Absorber.new
	end
  end
  helpers MethodAbsorber
end
