class SessionsController < ApplicationController

  def new
  end
  

  def create
     #Creates a new session once User password is authenticated. This will also create a new session. 
     #Once logged in user will be redirected to login path else 
  	 user = User.where(email: params[:login][:email]).first
     if user && user.authenticate(params[:login][:password])
    	 session[:user_id] = user.id.to_s
         redirect_to user_path(current_user)
    else
        redirect_to login_path
    end
  end
  # ends sessions when logged out and redirects to login
  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end


