class VegetablesController < ApplicationController

	

	def index
		@vegetables= @garden.vegetables.all
	end

	#def show
		#@vegetable=Vegetable.find(params[:id])
	#end

	

    def new
    	#@garden = Garden.find(params[:garden_id])
	    @vegetables = @garden.vegetables.new
	end


	def create
			@garden= Garden.find(params[:garden_id])
			@vegetable = @garden.vegetable.create!(params[:vegetable])
			if vegetable.save
			 redirect_to @garden, :notice => "Veggie created!"
			else
				render "new"
			end
				
	end			

	def update
		@vegetables = Vegetable.find(params[:id])
	    if @vegetables.update_attributes(params.require(:vegetable).permit(:name, :quantity))
	    	redirect_to vegetables_path
	    else render "edit"
    	end
	end

	def edit
		@vegetable = Vegetable.find(params[:id])
	end

	def destroy
		@vegetables=Vegetable.find(params[:id])
		@vegetables.destroy
		redirect_to vegetables_path
	end

  
end
