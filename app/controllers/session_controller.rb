class SessionController < ApplicationController

  skip_before_action :authorized
  before_action :redirect_if_logged_in, only: [:login]

  def login
    @readme = File.read "#{Rails.root}/README.md"
  end

  # simple login without password
  def create
    user = User.create_or_find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      redirect_to rooms_path
    else
      flash[:error] = "Invalid email or password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def redirect_if_logged_in
    redirect_to rooms_path if logged_in?
  end

end
