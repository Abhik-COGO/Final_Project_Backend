Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #Categories and article Relation
  get 'articleCategories/', to: "article_category#index";


  #reterive all articles
  get 'article/all' => 'article#allArticle';

  #create article
  post 'article/create' => 'article#create';

  #update article
  put 'article/update' => 'article#update';

  #find article
  get 'article/search' => 'article#findByID';

  #delete article
  delete 'article/delete' => 'article#delete';

  #read title
  get 'article/like' => 'article#readByTitle'

  #Show limited content on page
  get 'article/pagination' => 'article#pagination'

  # -------------------------------------------------------------------------------
  
  #show all categories
  get 'categories/all' => 'category#allCategories';

  #create categories
  post 'categories/create' => 'category#create';

  #delete categories
  post 'categories/delete' => 'category#delete'

  #search by category ID
  post 'categories/searchBy' => 'category#findByCat';

  #search categories by ID
  get 'categories/search' => 'categories#findById';

  # ----------------------------------------------------------------------------
 
  #create user
  post 'user/create' => 'user#create';

  #show all users
  get 'user/all' => 'user#allUser';

  #delete user
  delete 'user/delete' => 'user#destroy'

  # --------------------------------------------------------------------------

  # To check for login
  post '/auth/login', to: 'authentication#login'

  #To get all the user data
  get '/users', to: "users#index"

  #To Create new User
  post '/users', to: 'users#create'

  #To Show unique user
  get '/users/:username', to: 'user#show'

  #To Update user
  put '/users/:username', to: 'user#update'

  #To delete user
  delete '/users/:username', to: 'user#destroy'



end
