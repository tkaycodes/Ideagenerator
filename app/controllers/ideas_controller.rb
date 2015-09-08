class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to ideas_path, notice: "Idea Saved"
    else
      flash[:notice] = "Couldnt Save your Idea :("
      render 'new'
    end
  end  

  private
  def idea_params
    params.require(:idea).permit(:name, :body)
  end
end
