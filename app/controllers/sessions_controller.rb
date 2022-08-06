class SessionsController < ApplicationController 

  def new 
  end

  def create 
    user = User.find_by(username: params[:username_or_email]) || User.find_by(email: params[:username_or_email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to session[:intended_url] || movies_path, notice: "Welcome back, #{user.name}!"
      session[:intended_url] = nil
    else
      flash.now[:alert] = 'Invalid credentails'
      render :new 
    end 
  end

  def destroy 
    session[:user_id] = nil 
    redirect_to root_url, notice: 'Signed out.'
  end
end