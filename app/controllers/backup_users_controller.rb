class UsersController < ApplicationController
  def new
     @user = User.new
  end
  
  def edit
    
  end
  
  def destroy
    
  end
  
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def create
    #@user = User.new(user_params)
    @user = User.new(params[:FirstName, :LastName, :Email])
    @user = Users.new(params[:FirstName, :LastName, :Email])
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:FirstName,:LastName, :Email)
    end
    
end
