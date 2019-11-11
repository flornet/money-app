class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts/1
  def show
    filename = "[Money] - " + @account.name + " (" + Time.now.to_s + ")"
    respond_to do |format|
      format.html
      format.csv { send_data @account.to_csv, filename: filename + ".csv" }
    end
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    @account.user = current_user

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /accounts/1
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end

  # def export_csv
	# require 'csv'
  #   account = Account.find(params[:id])
  #   entries = account.entries
  #   csv_string = CSV.generate(:col_sep => ";") do |csv|
  #      csv << ["Checked", "Date", "Category", "Comment", "Check number", "Value"]
  #      for entry in entries
  #          csv << [entry.checked,entry.effective_date,entry.category.name,entry.comment,entry.check_number,entry.value]
  #      end
  #   end
  #   filename = account.name+"_"+Time.now.to_s+".csv"
  #   send_data(csv_string,
  #         :type => 'text/csv; charset=utf-8; header=present',
  #         :filename => filename)
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :user_id)
    end
end
