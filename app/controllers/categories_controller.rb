class CategoriesController < ApplicationController
	before_action :authenticate_user!,only: [:new]
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def index
		@category = Category.all
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if 	@category.update(category_params)
			redirect_to categories_path
		else
			render 'edit'
		end
	end

	def destroy
		@category=Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	private
		def category_params
			params[:category].permit(:name)
		end
end
