class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  after_filter :check_out, only: [:create]
  #after_filter :checked_in, only: [:edit]
  
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end
  
  def index_all
    @transactions = Transaction.all
  end
  
  def check_if_laptop_is_available(id)
    transactions = Transaction.all
    transactions.each do |x|
      if x.laptops_id != id then
        return true
      end
    end
  end
  
  def check_out
    @transaction.update_attribute(:checked_out, true)
    @transaction.update_attribute(:checked_out_time,  Time.zone.now)
    match_id = @transaction.laptops_id
    laptops = Laptop.all
    
    laptops.each do |x|
      if x.id == match_id then
        x.update_attribute(:available, false)
      end
    end
  end
  
  def check_in
    @transaction.update_attribute(:checked_out, false)
    @transaction.update_attribute(:checked_in_time,  Time.zone.now)
  end
  
  def format_timestamp(timestamp)
    if timestamp == nil then
      return "N/A"
    else
      date = timestamp.strftime "%Y/%m/%d"
      time = timestamp.strftime "%l:%M:%S%p"
      time_split = time.split ":"
  
      time_split[0] = time_split[0].to_i
      if time_split[0].to_i  == 0 then
        time_split[0] = 12
      end
  
      result = "#{date} #{time_split.join ":"}"
      return result
    end
  end
  
  #History Report - User - Laptop - When - Checked Out Time - Checked In Time
  def history_report(transaction, x)
    @transaction = Transaction.find(transaction)
    laptopID = @transaction.laptops_id
    userID = @transaction.users_id
    outTime = format_timestamp(@transaction.checked_out_time)
    inTime = @transaction.checked_in_time
    
    if inTime == nil then
      inTime = "N/A"
    else
      inTime = format_timestamp(@transaction.checked_in_time)
    end
    
    laptop = LaptopsController.new.find_laptop_by_id(laptopID.to_i)
    user = UsersController.new.find_user_by_id(userID.to_i)
    #laptopName = laptop.item_name
    #laptopCode = laptop.scan_code
    
    report = [laptop, outTime, inTime, user]
    return report[x]
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end
  
  def laptops
    return "Test"
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to '/check-out', notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
        UserHistoriesController.new.add_record(@transaction)
        LaptopHistoriesController.new.add_record(@transaction)
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:laptops_id, :users_id, :checked_out, :checked_out_time, :checked_in, :checked_in_time)
    end
end
