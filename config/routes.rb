Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #Categories and article Relation
  get 'articleCategories/', to: "article_category#index";

  #-----------------------------------------------------------------------

  #reterive all articles
  get 'article/all', to: 'article#allArticle';

  #create article
  post 'article/create' => 'article#create';

  #update article
  put 'article/update' => 'article#update';

  # find article by author name
  get 'article/find' => 'article#findByAuthor';

  #delete article
  delete 'article/delete' => 'article#delete';

  #Show limited content on page
  get 'article/pagination' => 'article#pagination'

  #search by partial title
  get 'article/search' => 'article#readByTitle'

  # -------------------------------------------------------------------------------
  
  #show all categories
  get 'categories/all' => 'category#allCategories';

  #create categories
  post 'categories/create' => 'category#create';

  #delete categories
  post 'categories/delete' => 'category#delete'

  #search Articles by category 
  get 'categories/searchBy' => 'category#findByCat';

  #search categories by ID
  get 'categories/search' => 'category#findById';

  # ----------------------------------------------------------------------------
 
  #create user
  post 'user/create' => 'user#create';

  #show all users
  get 'user/all' => 'user#allUser';

  #delete user
  delete 'user/delete' => 'user#destroy';

  #update the user
  put 'user/update/' => 'user#update';

  # --------------------------------------------------------------------------

  # To check for login
  post '/auth/login', to: 'authentication#login'

  #----------------------------------------------------------------------------

  #total number of likes of that article
  post 'like/total', to: 'like#like'

  #most liked post
  get 'like/most', to: 'like#most_likes'

  #---------------------------------------------------------------------

  # add comment to post
  post 'comment', to: "comment#comment";

  # most commented post
  get 'comment/most', to: 'comment#most_comment'

end
