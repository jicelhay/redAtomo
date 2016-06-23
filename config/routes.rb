Rails.application.routes.draw do
  # Rutas API
  namespace :api, defaults: { format: :json } do
    post 'login' => 'users#login'
    post 'signup' => 'users#create'

    post 'registerclass' => 'parent_obligation#create'
    post 'deleteclass' => 'parent_obligation#destroy'

    get 'posts' => 'posts#index'
    post 'likepost' => 'posts#like_post'

    get 'comments' => 'comments#index'
    post 'comments/create' => 'comments#create'

    get 'pictures' => 'multimedia_posts#pictures'
    get 'videos' => 'multimedia_posts#pictures'

    get 'communications' => 'communication_posts#index'
    get 'communication' => 'communication_posts#show'

    post 'signcommunication' => 'communication_posts#sign_comunication'

  end

  root 'home#index'

  # Rutas a metodos javascript!
  get '/fetch_avisos_posts' => 'posts#avisos_from_school_class',
      as: 'fetch_avisos_posts'
  get '/fetch_multimedia_posts' => 'posts#multimedia_from_school_class',
      as: 'fetch_multimedia_posts'
  get '/fetch_comunicaciones_posts' => 'posts#comunicaciones_from_school_class',
      as: 'fetch_comunicaciones_posts'
  get '/fetch_configuracion' => 'home#configuracion',
      as: 'fetch_configuracion'

  post '/' => 'home#index', as: 'lms_init'

  devise_for :users

  resources :school_classes do
    resources :posts do
      resources :comments
    end
    resources :multimedia_posts
    resources :communication_posts
    resources :parent_obligation, only: [:create, :destroy]
  end
end

# == Route Map
#
#                   Prefix Verb   URI Pattern                                               Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                                  devise/sessions#new
#             user_session POST   /users/sign_in(.:format)                                  devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                                 devise/sessions#destroy
#            user_password POST   /users/password(.:format)                                 devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                             devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                            devise/passwords#edit
#                          PATCH  /users/password(.:format)                                 devise/passwords#update
#                          PUT    /users/password(.:format)                                 devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                                   devise/registrations#cancel
#        user_registration POST   /users(.:format)                                          devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                                  devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                                     devise/registrations#edit
#                          PATCH  /users(.:format)                                          devise/registrations#update
#                          PUT    /users(.:format)                                          devise/registrations#update
#                          DELETE /users(.:format)                                          devise/registrations#destroy
#                     root GET    /                                                         home#index
#       school_class_posts GET    /school_classes/:school_class_id/posts(.:format)          posts#index
#                          POST   /school_classes/:school_class_id/posts(.:format)          posts#create
#    new_school_class_post GET    /school_classes/:school_class_id/posts/new(.:format)      posts#new
#   edit_school_class_post GET    /school_classes/:school_class_id/posts/:id/edit(.:format) posts#edit
#        school_class_post GET    /school_classes/:school_class_id/posts/:id(.:format)      posts#show
#                          PATCH  /school_classes/:school_class_id/posts/:id(.:format)      posts#update
#                          PUT    /school_classes/:school_class_id/posts/:id(.:format)      posts#update
#                          DELETE /school_classes/:school_class_id/posts/:id(.:format)      posts#destroy
#           school_classes GET    /school_classes(.:format)                                 school_classes#index
#                          POST   /school_classes(.:format)                                 school_classes#create
#         new_school_class GET    /school_classes/new(.:format)                             school_classes#new
#        edit_school_class GET    /school_classes/:id/edit(.:format)                        school_classes#edit
#             school_class GET    /school_classes/:id(.:format)                             school_classes#show
#                          PATCH  /school_classes/:id(.:format)                             school_classes#update
#                          PUT    /school_classes/:id(.:format)                             school_classes#update
#                          DELETE /school_classes/:id(.:format)                             school_classes#destroy
#
