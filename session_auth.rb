module Sinatra
  module SessionAuth

	  def current_user
		self.options.user_model.get! session[:user]
	  end

  	  def login_required
		if session[:user]
		  return true
		else
		  session[:return_to] = request.fullpath
		  redirect '/login'
		  return false
		end
	  end

	  def redirect_to_stored
		if return_to = session[:return_to]
		  session[:return_to] = nil
		  redirect return_to
		else
		  redirect '/'
		end
	  end

	  def logout_user
		session[:user] = nil
	  end

  end
end
