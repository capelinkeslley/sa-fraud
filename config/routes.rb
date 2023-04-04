Rails.application.routes.draw do
  namespace :api do
    resources :users, only: :index

    resources :users do
      resources :bank_accounts do
        resources :user_transactions, only: :create
      end
      resource :bank_accounts, only: [] do
        get :user_bank_accounts
      end
    end

    resources :bank_accounts, only: [] do
      get :beneficiary_accounts
    end

    resources :transaction_analyses, only: :index
  end
end
