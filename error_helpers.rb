module Sinatra
  module Plugins
	module ErrorHelpers

	  def errors_for(field)
		out = ''
		if !flash[:error].nil? && !flash[:error][:errors].nil? && flash[:error][:errors].respond_to?(:on) && !flash[:error][:errors].on(field).nil?
		  out << '<span class="error">'
		  out << flash[:error][:errors].on(field).join("<br/>")
		  out << '</span>'
		end 
	  end

	  def value_of(field)
		  if !flash[:error].nil? && !flash[:error][:object].nil?
			flash[:error][:object].send(field.to_sym)
		  else
			nil
		  end
	  end

	  def error?(field)
		if !flash[:error].nil? && !flash[:error][:errors].nil? && flash[:error][:errors].respond_to?(:on) && !flash[:error][:errors].on(field).nil?
		  'error'
		else
		  ''
		end
	  end

	end
  end
end
