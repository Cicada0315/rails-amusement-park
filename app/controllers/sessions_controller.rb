class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:password])
        flash[:message] = "Succesful sign in"
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        flash[:message] = "Invalid Credentials"
        render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
