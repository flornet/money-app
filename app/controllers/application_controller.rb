class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :define_current_account
  before_action :load_preferences_from_cookies

  def define_current_account
    @current_account = ''
    if current_user && current_user.accounts.length > 0
      # Check if current request is bound to "account/show/[:id]"
      if (request.path_parameters[:controller] == "accounts") && (request.path_parameters[:action] == "show") && (request.path_parameters[:id] != nil)
        @current_account = Account.find(request.path_parameters[:id])
      elsif cookies[:selected_account]
        @current_account = Account.find_by_id(cookies[:selected_account])
      end
      if @current_account == ''
        @current_account = current_user.accounts[0]
      end
      cookies[:selected_account] = @current_account.id.to_s
    end
  end

  def load_preferences_from_cookies
    @last_used_category = cookies[:last_used_category]
    @number_of_entries = "30"
    if cookies[:number_of_entries]
      @number_of_entries = cookies[:number_of_entries]
    else
      cookies[:number_of_entries] = { :value => @number_of_entries.to_s,
                                      :expires => 365.days.from_now,
                                      :path => '/' }
    end
    @number_of_entries = @number_of_entries.to_i
  end
end
