class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/sessions/new'
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
      
    end

  end

  def show
    @user = User.find(params[:id])
    render 'users/show.html.erb'
  end

  def edit
    
    render '/users/edit.html.erb'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
