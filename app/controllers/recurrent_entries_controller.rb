class RecurrentEntriesController < ApplicationController
  before_action :set_recurrent_entry, only: [:show, :edit, :update, :destroy]

  # GET /recurrent_entries
  # GET /recurrent_entries.json
  def index
    @recurrent_entries = RecurrentEntry.all
  end

  # GET /recurrent_entries/1
  # GET /recurrent_entries/1.json
  def show
  end

  # GET /recurrent_entries/new
  def new
    @recurrent_entry = RecurrentEntry.new
  end

  # GET /recurrent_entries/1/edit
  def edit
  end

  # POST /recurrent_entries
  # POST /recurrent_entries.json
  def create
    @recurrent_entry = RecurrentEntry.new(recurrent_entry_params)

    respond_to do |format|
      if @recurrent_entry.save
        format.html { redirect_to @recurrent_entry, notice: 'Recurrent entry was successfully created.' }
        format.json { render :show, status: :created, location: @recurrent_entry }
      else
        format.html { render :new }
        format.json { render json: @recurrent_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recurrent_entries/1
  # PATCH/PUT /recurrent_entries/1.json
  def update
    respond_to do |format|
      if @recurrent_entry.update(recurrent_entry_params)
        format.html { redirect_to @recurrent_entry, notice: 'Recurrent entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @recurrent_entry }
      else
        format.html { render :edit }
        format.json { render json: @recurrent_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurrent_entries/1
  # DELETE /recurrent_entries/1.json
  def destroy
    @recurrent_entry.destroy
    respond_to do |format|
      format.html { redirect_to recurrent_entries_url, notice: 'Recurrent entry was successfully destroyed.' }
      format.json { head :no_content }
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
end
