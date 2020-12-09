class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if signed_in?
      @upcoming = current_user.created_events.upcoming_events
      @past = current_user.created_events.past_events
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    redirect_to users_path if @user.save
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
