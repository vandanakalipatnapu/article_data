class CategoriesController < ApplicationController
	# before_action :authenticate_user!,only: [:new]
	def new
		@category = Category.new
		
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			render json: {success: true,message: "A new category hasbeen created",category: @category}
			# redirect_to categories_path
		else
			render json: {success: false,message: "New category hsanot been created",errors: @category.error.full_messages}
			# render 'new'
		end
	end

	def index
		@categories = Category.all
		render json: {success: true,message: "All categories hasbeen selected",categories: @categories}
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if 	@category.update(category_params)
			render json: {success: true,message: "Selected category hasbeen updated",category: @category}
			# redirect_to categories_path
		else
			# render 'edit'
			render json: {success: false,message: "Selected category hasnot been updated",category: @category}
		end
	end

	def destroy
		@category=Category.find(params[:id])
		if @category.destroy
			render json: {sucess: true,message: "Selected category hasbeen deleted",category: @category}
		# redirect_to categories_path
		else
			render 'index'
			render json: {success: false,message: "Selected category hasnot been deleted",category: @category}
		end
	end

	private
		def category_params
			params.permit(:name)
		end
end
