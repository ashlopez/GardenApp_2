class UsersController < ApplicationController
	
	
	def index
		@users=User.all	
    end


    def new
		@users=User.new
	end
	

    def create
	    @users=User.new(user_params)

		if @users.save
			redirect_to users_path
		else
        	render "new"
      	end
	end
	
	
	private
	def user_params
		params.require(:user).permit(:group_id, :user_name,:email,:password)
	end
end

