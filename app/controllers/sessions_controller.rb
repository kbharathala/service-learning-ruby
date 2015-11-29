class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.password == params[:password]
      session[:user_id] = user.id
      if user.isAdmin
        redirect_to '/users'
      else
        redirect_to user
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
