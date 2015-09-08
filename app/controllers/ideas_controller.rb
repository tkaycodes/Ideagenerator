class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :get_idea, only: [:show]

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
    @user=@idea.user
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      # binding.pry
      redirect_to ideas_path, notice: "Idea Saved"
    else
      flash[:notice] = "Couldnt Save your Idea :("
      render 'new'
    end
  end  

  def show
  end

  private
  def idea_params
    params.require(:idea).permit(:name, :body, :user_id)
  end

  def authenticate_user!
    redirect_to new_session_path, notice: "You must login first!" unless session[:user_id].present?
  end

  def get_idea
    @idea=Idea.find(params[:id])
  end
end
