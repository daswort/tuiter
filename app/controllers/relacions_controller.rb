class RelacionsController < ApplicationController
  before_filter :signed_in_user

  def create
    @usuario = Usuario.find(params[:relacion][:seguido_id])
    current_user.seguir!(@usuario)
    respond_to do |format|
      format.html { redirect_to @usuario }
      format.js
    end
  end

  def destroy
    @usuario = Relacion.find(params[:id]).seguido
    current_user.dejar_de_seguir!(@usuario)
    respond_to do |format|
      format.html { redirect_to @usuario }
      format.js
    end
  end
end