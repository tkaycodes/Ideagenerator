class SessionsController < ApplicationController
  layout "user_login_registration"

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in"
    else
      flash[:notice] = "Failed Login"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
    # binding.pry
  end
  
end
