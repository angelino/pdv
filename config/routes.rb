Rails.application.routes.draw do

  resources :products
  resources :point_of_sales
  resources :storage_entry_types
  get 'financial_accounts/:id/cash_report' => 'financial_accounts#cash_report', as: :account_cash_report
  resources :financial_accounts

  match '*path', to: 'application#options', :via => :options

  devise_for :users, controllers: {sessions: 'users/sessions'}

  post   'images' => 'images#create'
  delete 'images/:id' => 'images#destroy'

  get 'point_of_sales/:id/storage' => 'storages#show', as: :storage
  get 'point_of_sales/:id/storage/entries' => 'storage_entries#index', as: :storage_entries
  post 'point_of_sales/:id/storage/entries' => 'storage_entries#create'

  post 'point_of_sales/:id/sales' => 'sales#create'
  get 'point_of_sales/:id/sells/report' => 'sales#report', as: :sells_report
  get 'point_of_sales/:id/sells/grouped_report' => 'sales#grouped_report', as: :grouped_sells_report
  get 'point_of_sales/:id/sales/:sales_id' => 'sales#show', as: :sale

  # Mobile API
  # FIXME: Change to appropriate controllers
  # TODO: Bypass the Authentication
  get 'diners' => 'diners#index'
  get 'diners/:id' => 'diners#show'
  get 'diners/:id/menu' => 'menus#show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
end
