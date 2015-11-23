class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
    # user = User.find_by(email: params[:session][:email].downcase)
    # if user && user.authenticate(params[:session][:password])
    #   puts YAML::dump(user)
    #   puts YAML::dump(session[:user_id])
    #   log_in user
    #   redirect_to posts_url
    # else
    #   flash.now[:danger] = 'Invalid email/password'
    #   redirect_to :back
    # end
  end

  def destroy
    # reset_session
    # redirect_to root_path
    log_out if logged_in?
    redirect_to root_url
  end
end
