Myportfolio::Application.routes.draw do

  root :to => 'home#index'

  resources :home, :only => [:index] do
    collection do
      get 'recipezy'
      get 'moviez'
      get 'flickr'
      get 'team8'
      get 'interviewr'
    end
  end

end