class PagesController < ApplicationController
  def index
    authorize! :dashboard, @user
    @users = User.all
  end

  def change_role
    authorize! :dashboard, @user
    @user = User.find(params[:user_id])
    if @user.role.nil?
      @user.role = "admin"
    end
    @user.save!
    redirect_to :dashboard
  end

end
