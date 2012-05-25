class UsuariosController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  
  def index
    @usuarios = Usuario.paginate(page: params[:page])
  end
  
  def show
    @usuario = Usuario.find(params[:id])
	@tuits = @usuario.tuits.paginate(page: params[:page])
  end
  
  def create
    @usuario = Usuario.new(params[:usuario])
	if @usuario.save
	  sign_in @usuario
      flash[:success] = "Bienvenido a Tuiter!"
	  redirect_to @usuario
    else
      render 'new'
    end
  end
  
  def new
    @usuario = Usuario.new
  end
  
  def edit
  end
  
  def update
    if @usuario.update_attributes(params[:user])
      flash[:success] = "Haz actualizado tu perfil"
      sign_in @usuario
      redirect_to @usuario
    else
      render 'edit'
    end
  end
  
  def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario eliminado."
    redirect_to usuarios_path
  end
  
  def siguiendo
    @titulo = "Siguiendo"
    @usuario = Usuario.find(params[:id])
    @usuarios = @usuario.usuarios_seguidos.paginate(page: params[:page])
    render 'show_seguir'
  end

  def seguidores
    @titulo = "Seguidores"
    @usuario = Usuario.find(params[:id])
    @usuarios = @usuario.usuarios_seguidores.paginate(page: params[:page])
    render 'show_seguir'
  end
  
  private

    def signed_in_user
	  unless signed_in?
        store_location
        redirect_to ingreso_path, notice: "Por favor inicia sesion."
      end
    end
	
	def correct_user
      @usuario = Usuario.find(params[:id])
      redirect_to(root_path) unless current_user?(@usuario)
    end
	
	def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
