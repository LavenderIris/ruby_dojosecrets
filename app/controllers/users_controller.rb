class UsersController < ApplicationController
  skip_before_action :require_login, :isValidUser, only: [:new, :create]
 

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
    @user = User.find(params[:id])
    render '/users/edit.html.erb'
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages     
      redirect_to "/users/#{@user.id}/edit"
    end
  end

  def delete
    @user = User.find(params[:id])
    # create the if statement to get destroy and if it is successful, log out
    if @user.destroy
      reset_session
      redirect_to '/users/new'
    else
      redirect_to "/users/#{@user.id}/edit" 
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  
  def isValidUser
    if User.find(params[:id]) != current_user
      redirect_to '/users/#{session[:user_id]}'
    end
  end

end
