class SessionsController < ApplicationController
  # GET /sessions/new
  # GET /sessions/new.json
  def new
   @title = "sign in"
  end


  # POST /sessions
  # POST /sessions.json
  def create
    user = User.authenticate(params[:name],params[:password])
    if user.nil? == false
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'logged in'
    else
      redirect_to '/sessions/new', :notice => 'Invalid username or password'
    end
  end



  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    session[:user_id] = nil
    redirect_to posts_path, :notice => 'logged out'
  end
end