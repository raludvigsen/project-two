Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, :only => [:create]
  end
  
  resources :visitors

  root 'posts#index'

  get    'new_user_session'   => 'devise/sessions#new'
  post   'user_session'   => 'devise/sessions#create'
  delete 'destroy_user_session'  => 'devise/sessions#destroy'
end


#                   Prefix Verb   URI Pattern                        Controller#Action
#         new_user_session GET    /users/sign_in(.:format)           devise/sessions#new
#             user_session POST   /users/sign_in(.:format)           devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)          devise/sessions#destroy
#            user_password POST   /users/password(.:format)          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)     devise/passwords#edit
#                          PATCH  /users/password(.:format)          devise/passwords#update
#                          PUT    /users/password(.:format)          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)            devise/registrations#cancel
#        user_registration POST   /users(.:format)                   devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)           devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)              devise/registrations#edit
#                          PATCH  /users(.:format)                   devise/registrations#update
#                          PUT    /users(.:format)                   devise/registrations#update
#                          DELETE /users(.:format)                   devise/registrations#destroy
#            post_comments POST   /posts/:post_id/comments(.:format) comments#create
#                    posts GET    /posts(.:format)                   posts#index
#                          POST   /posts(.:format)                   posts#create
#                 new_post GET    /posts/new(.:format)               posts#new
#                edit_post GET    /posts/:id/edit(.:format)          posts#edit
#                     post GET    /posts/:id(.:format)               posts#show
#                          PATCH  /posts/:id(.:format)               posts#update
#                          PUT    /posts/:id(.:format)               posts#update
#                          DELETE /posts/:id(.:format)               posts#destroy
#                 visitors GET    /visitors(.:format)                visitors#index
#                          POST   /visitors(.:format)                visitors#create
#              new_visitor GET    /visitors/new(.:format)            visitors#new
#             edit_visitor GET    /visitors/:id/edit(.:format)       visitors#edit
#                  visitor GET    /visitors/:id(.:format)            visitors#show
#                          PATCH  /visitors/:id(.:format)            visitors#update
#                          PUT    /visitors/:id(.:format)            visitors#update
#                          DELETE /visitors/:id(.:format)            visitors#destroy
#                     root GET    /                                  posts#index
#                          GET    /new_user_session(.:format)        devise/sessions#new
#                          POST   /user_session(.:format)            devise/sessions#create
#                          DELETE /destroy_user_session(.:format)    devise/sessions#destroy
