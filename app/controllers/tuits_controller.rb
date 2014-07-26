class TuitsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy
  
  def create
    @tuit = current_user.tuits.build(params[:tuit])
    if @tuit.save
      flash[:success] = "Tu tuit ha sido creado!"
      redirect_to root_path
    else
	  @feed_items = []
      render 'paginas_estaticas/inicio'
    end
  end

  def destroy
    @tuit.destroy
    redirect_to root_path
  end
  
  private

    def correct_user
      @tuit = current_user.tuits.find_by_id(params[:id])
      redirect_to root_path if @tuit.nil?
    end
end