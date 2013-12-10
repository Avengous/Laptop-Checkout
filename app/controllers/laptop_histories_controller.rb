class LaptopHistoriesController < ApplicationController
  before_action :set_laptop_history, only: [:show, :edit, :update, :destroy, :create]

  # GET /laptop_histories
  # GET /laptop_histories.json
  def search
    @laptop_histories = LaptopHistory.where(:laptop_id => params[:laptop_id])
    render :action => :index
  end
  
  def index
    @laptop_histories = LaptopHistory.all
  end

  # GET /laptop_histories/1
  # GET /laptop_histories/1.json
  def show
  end

  # GET /laptop_histories/new
  def new
    @laptop_history = LaptopHistory.new
  end

  # GET /laptop_histories/1/edit
  def edit
  end

  # POST /laptop_histories
  # POST /laptop_histories.json
  def create
    @laptop_history = LaptopHistory.new(laptop_history_params)

    respond_to do |format|
      if @laptop_history.save
        format.html { redirect_to @laptop_history, notice: 'Laptop history was successfully created.' }
        format.json { render action: 'show', status: :created, location: @laptop_history }
      else
        format.html { render action: 'new' }
        format.json { render json: @laptop_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_record(transaction)
    record = LaptopHistory.new(:laptop_id => transaction.laptops_id, :transaction_id => transaction.id)
    record.save
  end

  # PATCH/PUT /laptop_histories/1
  # PATCH/PUT /laptop_histories/1.json
  def update
    respond_to do |format|
      if @laptop_history.update(laptop_history_params)
        format.html { redirect_to @laptop_history, notice: 'Laptop history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @laptop_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptop_histories/1
  # DELETE /laptop_histories/1.json
  def destroy
    @laptop_history.destroy
    respond_to do |format|
      format.html { redirect_to laptop_histories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laptop_history
      @laptop_history = LaptopHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laptop_history_params
      params.require(:laptop_history).permit(:laptop_id, :transaction_id)
    end
end
