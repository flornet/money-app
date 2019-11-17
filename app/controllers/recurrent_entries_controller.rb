class RecurrentEntriesController < ApplicationController
  before_action :set_recurrent_entry, only: [:show, :edit, :update, :destroy]

  # GET /recurrent_entries
  # GET /recurrent_entries.json
  def index
    @recurrent_entries = RecurrentEntry.all
  end

  # GET /recurrent_entries/new
  def new
    @recurrent_entry = RecurrentEntry.new
  end

  # GET /recurrent_entries/1/edit
  def edit
  end

  # POST /recurrent_entries
  def create
    @recurrent_entry = RecurrentEntry.new(reformat_value(recurrent_entry_params))
    @recurrent_entry.user = current_user

    respond_to do |format|
      if @recurrent_entry.save
        format.html { redirect_to recurrent_entries_url, notice: 'Recurrent entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /recurrent_entries/1
  def update
    respond_to do |format|
      if @recurrent_entry.update(reformat_value(recurrent_entry_params))
        format.html { redirect_to recurrent_entries_url, notice: 'Recurrent entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /recurrent_entries/1
  def destroy
    @recurrent_entry.destroy
    respond_to do |format|
      format.html { redirect_to recurrent_entries_url, notice: 'Recurrent entry was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recurrent_entry
      @recurrent_entry = RecurrentEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recurrent_entry_params
      params.require(:recurrent_entry).permit(:active, :user_id, :account_id, :category_id, :checked, :comment, :value, :frequency, :start_date, :end_date)
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
