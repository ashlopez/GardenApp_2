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
		# params passes the user ID as a hash then finds the user object with the params and the user instance
	    # varible allows us to do methods on a particular user object within the view
	    # this is for th current viewer to see their own profile
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

	
	def edit
      @users = User.find(params[:id])
    end

	
	def update
 		@user = User.find(params[:id])
 		if @user.update(user_params)
    		redirect_to(@users)
 		 else
    	render "edit"
    	end
	end

	
	def destroy
		@user=User.find(params[:id])
		@user.destroy
		destroy_session
		redirect_to login_path
	end
	

	private
	def user_params
		params.require(:user).permit(:group_id, :user_name,:email,:password)
	end
end

