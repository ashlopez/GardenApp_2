class VegetablesController < ApplicationController

	

	def index
		@vegetables=Vegetable.all
	end

	def show
		@vegetable=Vegetable.find(params[:id])
	end

	

    def new
	    @vegetables = Vegetable.new
	end


	def create
			@gardens = Garden.find(params[:garden_id])
			@vegetables = @gardens.vegetables.create!(params[:vegetable])
			 redirect_to @gardens, :notice => "Veggie created!"
				
	end			

	def update
		@vegetables = Vegetable.find(params[:id])
	    if @vegetables.update_attributes(params.require (:vegetable).permit(:name, :quantity))
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
