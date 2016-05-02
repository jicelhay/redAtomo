Rails.application.routes.draw do

  devise_for :users

  root 'home#index'

  resources :school_classes do
    resources :posts
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

# Example of regular route:
#   get 'products/:id' => 'catalog#view'

# Example of named route that can be invoked with purchase_url(id: product.id)
#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

# Example resource route (maps HTTP verbs to controller actions automatically):
#   resources :products

# Example resource route with options:
#   resources :products do
#     member do
#       get 'short'
#       post 'toggle'
#     end
#
#     collection do
#       get 'sold'
#     end
#   end

# Example resource route with sub-resources:
#   resources :products do
#     resources :comments, :sales
#     resource :seller
#   end

# Example resource route with more complex sub-resources:
#   resources :products do
#     resources :comments
#     resources :sales do
#       get 'recent', on: :collection
#     end
#   end

# Example resource route with concerns:
#   concern :toggleable do
#     post 'toggle'
#   end
#   resources :posts, concerns: :toggleable
#   resources :photos, concerns: :toggleable

# Example resource route within a namespace:
#   namespace :admin do
#     # Directs /admin/products/* to Admin::ProductsController
#     # (app/controllers/admin/products_controller.rb)
#     resources :products
#   end
