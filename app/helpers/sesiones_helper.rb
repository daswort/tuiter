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
  
  def current_user?(usuario)
    usuario == current_user
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to ingreso_path, notice: "Por favor inicia sesion."
    end
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end
end

