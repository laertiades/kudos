class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user.present? && user.password == params[:password]
      session[:user_id] = user.id
      redirect_to users_show_path
    else
      flash.now[:error] = 'Invalid credentials'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
