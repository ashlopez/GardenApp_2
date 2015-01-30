class VegetablesController < ApplicationController

	

	def index
		@vegetables= @garden.vegetables.all
	end

	#def show
		#@vegetable=Vegetable.find(params[:id])
	#end

	

    def new
    	@garden = Garden.find(params[:garden_id])
	    @vegetable = @garden.vegetables.new
	end


	def create
		
			@garden= Garden.find(params[:garden_id])
			# @vegetable = @garden.vegetable.create!(params[:vegetable])
			@vegetable = @garden.vegetables.create(vegetables_params)
			redirect_to @garden, :notice => "Veggie created!"

			# if @vegetable.save
			#  redirect_to @garden, :notice => "Veggie created!"
			# else
			# 	render "new"
			# end

			# post = Post.find(params[:post_id])
			# comment = post.comments.create(comment_params)
				
	end			

	def update
		@vegetable = Vegetable.find(params[:id])
	    if @vegetable.update_attributes(vegetables_params)
	    	redirect_to vegetables_path
	    else render "edit"
    	end
	end

	def edit
		@garden = Garden.find(params[:garden_id])
		@vegetable = Vegetable.find(params[:id])
	end

	def destroy
		@vegetables=Vegetable.find(params[:id])
		@vegetables.destroy
		redirect_to vegetables_path
	end

	private 
	def vegetables_params
		params.require(:vegetable).permit(:name, :quantity)
	end
  
end
