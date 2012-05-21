module SesionesHelper

  def sign_in(usuario)
    cookies.permanent[:remember_token] = usuario.remember_token
    current_user = usuario
  end
  
  def sign_out
    current_user = nil
    cookies.delete(:remember_token)
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def current_user=(usuario)
    @current_user = usuario
  end
  
  def current_user
    @current_user ||= Usuario.find_by_remember_token(cookies[:remember_token])
  end
end

