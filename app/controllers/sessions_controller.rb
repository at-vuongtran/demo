class SessionsController < ApplicationController
  def new; end
  
  def create
    email = params[:session][:email]
    password = params[:session][:password]
    @user = User.find_by(email: email)
    if @user&.authenticate(password)
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash.now[:error] = 'Invalid email/password'
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
