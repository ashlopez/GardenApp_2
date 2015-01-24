class UsersController < ApplicationController
	
	
	def index
		# method that lists all users in the User's index.html.erb views page
		@users=User.all	
    end


    def new
        # creates new user
		@users=User.new
	end

	def show
		@user = User.find(params[:id])
	end
	

    def create
    	# creates new user
	    @users=User.new(user_params)
        #once users succesfully sign-up they will be redirected to the login page
		if @users.save
			redirect_to login_path
		else
        	render "new"
      	end
	end
	
	
	private
	def user_params
		params.require(:user).permit(:group_id, :user_name,:email,:password)
	end
end

