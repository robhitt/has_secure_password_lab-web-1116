class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    # binding.pry
    if @user && params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:notice] = 'Username or password was incorrect'
      redirect_to signup_path
    end
  end

end
