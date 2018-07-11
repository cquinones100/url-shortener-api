Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '*path',
    to: 'application#home',
    constraints: ->(req) { !req.xhr? && req.format.html? }
end