class SesionesController < ApplicationController

  def new
  end

  def create
    @usuario = Usuario.find_by_email(params[:sesion][:email])
    if @usuario && @usuario.authenticate(params[:sesion][:password])
      sign_in @usuario
      redirect_back_or @usuario
    else
      flash.now[:error] = 'Combinacion email/contrasena invalida!'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  
end
