class FollowsController < ApplicationController
  def create
    begin
      @user = current_user # this will change once we add login
      @followed_user = User.find(params[:follow])
      raise if @user == @followed_user # don't let users follow themselves
      Follow.create user_id: @user.id, follow_id: @followed_user.id
      redirect_to user_path(@followed_user), notice: 'Followed ' + @followed_user.username
    rescue
      # assume they are already following
      redirect_to user_path(@followed_user)
    end
  end

  def destroy
    begin
      @user = current_user # this will change once we add login
      @followed_user = User.find(params[:follow])
      Follow.find_by_user_id_and_follow_id(@user.id, @followed_user.id).destroy
      redirect_to user_path(@followed_user), notice: 'Unfollowed ' + @followed_user.username
    rescue
      redirect_to user_path(@followed_user)
    end
  end
end