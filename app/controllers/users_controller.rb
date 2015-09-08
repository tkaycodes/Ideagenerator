class UsersController < ApplicationController
  layout 'user_login_registration'

  def new
    @user=User.new
  end

  def create
    render text: params
  end
end
