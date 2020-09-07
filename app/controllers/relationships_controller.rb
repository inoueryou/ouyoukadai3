class RelationshipsController < ApplicationController

  def create
    if current_user.follow(params[:id])
      flash[:success] = 'ユーザーをフォローしました'
      redirect_back(fallback_location: users_path)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_back(fallback_location: users_path)
    end
  end

  def destroy
    if current_user.unfollow(params[:id])
      flash[:success] = 'ユーザーのフォローを解除しました'
     redirect_back(fallback_location: users_path)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
     redirect_back(fallback_location: users_path)
    end
  end

  def index
  end

end
