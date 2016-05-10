class ArticlesController < ApplicationController
	before_action :authenticate_user!,only: [:new]
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
		render json: {success: true,message: "Required article",article: @article,comment: @article.comments} and return

		if 	@article.user_id == nil
			@article.update(user_id: current_user.id)
			user_id = @article.user_id
			# @user=current_user.users.find(params[:id])
		else
			render 'show'
		end		
	end

	def create
		@categories = Category.all
		@article = Article.new(article_params)
		if @article.save
			render json: {success: true,message: "article has been created",article: @article}
			UserMailer.welcome_user(current_user.email).deliver_now
			redirect_to @article
		else
			render json: {success: false, message: "article has not been created",errors: @article.errors.full_messages}
			render 'new'

		end
	end

	def edit
		@categories = Category.all
		@article = Article.find(params[:id])
		render json: {success: true, message: "Selected article has been edited",message: @article}
		
	end

	def update
		@categories = Category.all
		@article = Article.find(params[:id])
		if @article.update(article_params)
			render json: {success: true, message: "selected article has been updated",article: @article} and return
			redirect_to @article
		else
			render json: {success: false, message: "selected article has not been updated",errors: @article.errors.full_messages} and return
			render 'edit'
		end
	end

	def destroy
		@categories = Category.all
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to @article
	end

	def comment_show
		@categories = Category.all
		@article = Article.find(params[:article_id])
	end

	

	private

	def article_params
		params.permit(:title,:text,:category_id,:image)
	end
end
