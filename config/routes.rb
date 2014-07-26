Tuiterr::Application.routes.draw do
  resources :usuarios do
    member do
	   get :siguiendo, :seguidores
	end
  end
  resources :sesiones, only: [:new, :create, :destroy]
  resources :tuits, only: [:create, :destroy]
  resources :relacions, only: [:create, :destroy]
  
  root to: 'paginas_estaticas#inicio'
  match '/registro', to: 'usuarios#new', via: 'get'
  match '/ingreso',  to: 'sesiones#new', via: 'get'
  match '/salir',    to: 'sesiones#destroy', via: 'delete'
  match '/ayuda',    to: 'paginas_estaticas#ayuda', via: 'get'
  match '/nosotros', to: 'paginas_estaticas#nosotros', via: 'get'
  match '/contacto', to: 'paginas_estaticas#contacto', via: 'get'
end
