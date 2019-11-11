class EntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :update, :destroy]

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  def create
    @entry = Entry.new(reformat_value(entry_params))
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry.account}
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /entries/1
  def update
    respond_to do |format|
      if @entry.update(reformat_value(entry_params))
        format.html { redirect_to @entry.account }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /entries/1
  def destroy
    @account = @entry.account
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to @account }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:account_id, :category_id, :recurrent_entry_id, :effective_date, :checked, :check_number, :comment, :value)
    end

    # Works only with the 'value' field
    #   Replaces ',' by '.'
    #   Adds '-' when nothing is provided by default
    def reformat_value(params)
      local_params = params
      if (!local_params[:value].to_s.starts_with?("+") && !local_params[:value].to_s.starts_with?("-"))
        local_params[:value] = local_params[:value].to_s.gsub(',', '.').to_f.to_s
        local_params[:value] = - local_params[:value].to_f
      else
        local_params[:value] = local_params[:value].to_s.gsub(',', '.').to_f.to_s
      end
      return local_params
    end

end
