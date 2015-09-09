class JoinedsController < ApplicationController
  def create
    # render text: params
    @joined = Joined.new(user_id: params[:user_id], idea_id: params[:idea_id])
    if @joined.save
      redirect_to :back, notice: "Joined!"
    else
      redirect_to :back, notice: "Couldnt Join"
    end
  end

  def destroy
    # render text: params
    @joined = Joined.find(params[:id])
    if @joined.delete
      redirect_to :back, notice: "Un-Joined!"
    else
      redirect_to :back, notice: "Cant Un-Join"
    end
  end
end
