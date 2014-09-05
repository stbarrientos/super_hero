class SuperherosController < ApplicationController

	def index
		@superheros = Superhero.all
	end

	def show
		@superhero = Superhero.find(params[:id])
	end

	def new
		@superhero = Superhero.new
	end

	def edit
		@superhero = Superhero.find(params[:id])
	end

	def update
		@superhero = Superhero.find(params[:id])
		@superhero.update_attributes(superhero_params)
		if @superhero.save
			redirect_to superhero_path(@superhero.id)
		else
			redirect_to superheros_path
		end
	end

	def create
		@superhero = Superhero.new(superhero_params)
		if @superhero.save
			redirect_to superhero_path(@superhero.id)
		else
			redirect_to superheros_path
		end
	end

	def destroy
		@superhero = Superhero.find(params[:id])
		@superhero.destroy
	end

	private

	def superhero_params
		params.require(:superhero).permit(:name, :cape, :superpower, :image)
	end

end