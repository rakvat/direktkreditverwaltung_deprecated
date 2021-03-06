Direktkreditverwaltung::Application.routes.draw do


  resources :contract_versions


  get "home/index"
  get "contracts/interest"
  get "contracts/interest_transfer_list"
  get "contracts/interest_average"
  get "contracts/expiring"
  get "contracts/remaining_term"

  resources :accounting_entries
  
  resources :contracts do
    resources :accounting_entries
    resources :contract_versions
  end

  resources :contacts do
    resources :contracts do
      resources :accounting_entries
    end  
  end


  root :to => "home#index"
  
end
