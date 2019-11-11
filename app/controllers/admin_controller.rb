class AdminController < ApplicationController
  def index
    if current_user.accounts.length > 0 && @current_account
      redirect_to @current_account
    else
      redirect_to new_account_path, notice: 'Créez votre premier compte pour commencer'
    end
  end
end
