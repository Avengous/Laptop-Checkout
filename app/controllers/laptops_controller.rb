class LaptopsController < ApplicationController
  before_action :set_laptop, only: [:show, :edit, :update, :destroy]

  # GET /laptops
  # GET /laptops.json
  def index
    @laptops = Laptop.all
  end
  
    def find_laptop_by_id(id)
    laptops = Laptop.all
    laptops.each do |x|
      if x.id == id then
        return x.item_name
      end
    end
  end

  # GET /laptops/1
  # GET /laptops/1.json
  def show
  end

  # GET /laptops/new
  def new
    @laptop = Laptop.new
  end

  # GET /laptops/1/edit
  def edit
  end

  # POST /laptops
  # POST /laptops.json
  def create
    @laptop = Laptop.new(laptop_params)

    respond_to do |format|
      if @laptop.save
        format.html { redirect_to @laptop, notice: 'Laptop was successfully created.' }
        format.json { render action: 'show', status: :created, location: @laptop }
      else
        format.html { render action: 'new' }
        format.json { render json: @laptop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /laptops/1
  # PATCH/PUT /laptops/1.json
  def update
    respond_to do |format|
      if @laptop.update(laptop_params)
        format.html { redirect_to @laptop, notice: 'Laptop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @laptop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laptops/1
  # DELETE /laptops/1.json
  def destroy
    @laptop.destroy
    respond_to do |format|
      format.html { redirect_to laptops_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_laptop
      @laptop = Laptop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def laptop_params
      params.require(:laptop).permit(:scan_code, :item_name)
    end
end
