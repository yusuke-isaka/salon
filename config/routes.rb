Salon::Application.routes.draw do
  get 'faq', :to => 'faq#index', :format => false
  post 'faq/back', :to => 'faq#back', :format => false
  post 'faq/confirm', :to => 'faq#confirm', :format => false
  post 'faq/complete', :to => 'faq#complete', :format => false
end
