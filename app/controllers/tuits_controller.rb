class TuitsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @tuit = current_user.tuits.build(tuit_params)
    if @tuit.save
      flash[:success] = "Tuit creado!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  	@tuit.destroy
    redirect_to root_url
  end

  private

    def tuit_params
      params.require(:tuit).permit(:content)
    end

    def correct_user
      @tuit = current_user.tuits.find_by(id: params[:id])
      redirect_to root_url if @tuit.nil?
    end
end