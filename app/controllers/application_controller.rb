class ApplicationController < ActionController::Base  
  def after_sign_out_path_for(resource)
    return request.env['omniauth.origin'] || session[:return_to] ||= request.referer
  end
  
end
