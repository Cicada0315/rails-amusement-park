class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in, only: [:show]
  before_action :set_user, only: [:show]

  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      
      flash[:message] = "Successfully signed up."
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = "Couldn't create user"
      render :new
    end
  end

  def show
  

  end


  private 
  def set_user
    @user=User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :admin, :password, :nausea, :happiness, :height, :tickets)
  end
end