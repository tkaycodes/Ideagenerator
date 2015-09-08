class UsersController < ApplicationController
  layout 'user_login_registration'

  def new
    @user=User.new
  end

  def create
    # render text: params
    @user = User.new(user_params)
    if @user.save
      redirect_to ideas_path, notice: "Sucessfully Registered!"
      session[:user_id] = @user.id #add user_id to session hash
      # binding.pry
    else
    # flash[:notice] = "Couldnt Create "
    render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
