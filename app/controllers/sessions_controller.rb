class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Signed in successfully."
    else
      redirect_to new_session_url, notice: "Something went wrong."
    end
  end

  def destroy
  end
end
