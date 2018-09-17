Rails.application.routes.draw do
  resources :nota_por_cursos
  resources :nome_por_cursos
  resources :cursos
  resources :faculdades
  root 'faculdades#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
