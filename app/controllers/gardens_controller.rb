class GardensController < ApplicationController
	
	def show
		@gardens=Garden.find(params[:id])
	end

	def index
		@gardens=Garden.all
    end

    def new
		@gardens = Garden.new
	end


	def create
		@gardens = Garden.new(params.require (:garden).permit(:name, :location))
		
		if @gardens.save
        redirect_to gardens_path
      	else
        render "new"
        end
	end

	def update
		@gardens = Garden.find(params[:id])
	    if @gardens.update_attributes(params.require (:garden).permit(:name, :location))
	    	redirect_to gardens_path
	    else render "edit"
    	end
	end


	def destroy
		@gardens=Garden.find(params[:id])
		@gardens.destroy
		redirect_to gardens_path
	end

	def edit
		@gardens = Garden.find(params[:id])
	end

	
end
