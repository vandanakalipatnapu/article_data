class ArticlesController < ApplicationController
	# before_action :authenticate_user!,only: [:new]
	def new
		@categories = Category.all
		@article = Article.new
	end

	def index
		@categories = Category.all
		@articles = Article.all
	    @articles = Article.page(params[:page]).per(10)
	    render json: {success: true,message: "all articles",articles: @articles}
	end

	def show
		@article = Article.find(params[:id])
		@category = Category.find(@article.category_id)
		render json: {success: true,message: "Required article",article: @article,comment: @article.comments}

		# if 	@article.user_id == nil
			# @article.update(user_id: current_user.id)
			# user_id = @article.user_id
			# @user=current_user.users.find(params[:id])
		# else
			# render 'show'
			# render json: {success: false,message: "Required article",article: @article,errors: @article.errors.full_messages}	
		# end		
	end

	def create
		@categories = Category.all
		@article = Article.new(article_params)
		if @article.save
			render json: {success: true,message: "article has been created",article: @article,image: @article.image}
			# UserMailer.welcome_user(current_user.email).deliver_now
			# redirect_to @article
		else
			render json: {success: false, message: "article has not been created",errors: @article.errors.full_messages}
			# render 'new'

		end
	end

	def edit
		@categories = Category.all
		@article = Article.find(params[:id])
	end

	def update
		@categories = Category.all
		@article = Article.find(params[:id])
		if @article.update(article_params)
			render json: {success: true, message: "selected article has been updated",article: @article}
			# redirect_to @article
		else
			render json: {success: false, message: "selected article has not been updated",errors: @article.errors.full_messages}
			# render 'edit'
		end
	end

	def destroy
		@categories = Category.all
		@article = Article.find(params[:id])
		if @article.destroy
			render json: {success: true,messsage: "Selected article hasbeen deleted",article: @article}
		# redirect_to @article
		else
			# render 'index'
			render json: {success: true,message: "Selected article hasnot been deleted",errors: @article.errors.full_messages}
		end
	end

	def comment_show
		@categories = Category.all
		@article = Article.find(params[:article_id])
		# render json: {success: true,message: "Selected article hasnot been deleted"}

	end

	

	private

	def article_params
		params.permit(:title,:text,:category_id,:image)
	end
end
