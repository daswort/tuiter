class UsuariosController < ApplicationController
  def show
    @usuario = Usuario.find(params[:id])
  end
  
  def new
    @usuario = Usuario.new
	if @usuario.save
      flash[:success] = "Bienvenido a Tuiter!"
	  redirect_to @usuario
    else
      render 'new'
    end
  end
  
  def create
  end
end
