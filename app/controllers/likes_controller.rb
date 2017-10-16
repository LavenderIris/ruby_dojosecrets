class LikesController < ApplicationController

  def create
    Like.create(like_params)
    redirect_to "/secrets"
  end

  def destroy
    @like = Like.find(params[:id])
    if current_user === @like.user
      @like.destroy 
    end
    redirect_to "/secrets"
  end

  private
  def like_params
    params.require(:like).permit(:secret_id, :user_id)
  end
end
