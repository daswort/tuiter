class UsuariosController < ApplicationController
  def show
    @usuario = Usuario.find(params[:id])
  end
  
  def create
    @usuario = Usuario.new(params[:usuario])
	if @usuario.save
      flash[:success] = "Bienvenido a Tuiter!"
	  redirect_to @usuario
    else
      render 'new'
    end
  end
  
  def new
    @usuario = Usuario.new
  end
end
