class VegetablesController < ApplicationController

	

	def index
		@vegetables=Vegetable.all
	end

	def show
		@vegetables=Vegetable.find(params[:id])
	end

	

    def new
	    @vegetables = Vegetable.new
	end


	def create
		@vegetables = Vegetable.new(params.require (:vegetable).permit(:name, :quantity))
		
		if 	@vegetables.save
        redirect_to vegetables_path
      	else
        render "new"
        end
	end

	def update
		@vegetables = Vegetable.find(params[:id])
	    if @vegetables.update_attributes(params.require (:vegetable).permit(:name, :quantity))
	    	redirect_to vegetables_path
	    else render "edit"
    	end
	end

	def edit
		@vegetables = Vegetable.find(params[:id])
	end

	def destroy
		@vegetables=Vegetable.find(params[:id])
		@vegetables.destroy
		redirect_to vegetables_path
	end


end
