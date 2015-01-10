Rails.application.routes.draw do
  get '/' => redirect('https://github.com/fishermanswharff/GradingWizardApi')
  match '/travisreports' => 'travis#nomnom', via: [:post]
  resources :repos do
    resources :pull_requests
  end
end
