class PaginasEstaticasController < ApplicationController
  def inicio
    if signed_in?
      @tuit  = current_user.tuits.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def ayuda
  end

  def nosotros
  end
  
  def contacto
  end
end
