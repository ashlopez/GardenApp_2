module SessionsHelper


	def current_user
		@current_user ||= User.find(session[:user_id])
    end
	


    def logged_in?
  		session[:user_id] != nil
	end

	def destroy_session
    session.delete(:user_id)
    
  	end
end
