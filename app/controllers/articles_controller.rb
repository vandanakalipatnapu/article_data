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
	end

	def show
	
		@article = Article.find(params[:id])
		@category = Category.find(@article.category_id)
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
			UserMailer.welcome_user(current_user.email).deliver_now
			redirect_to @article
		else
			render 'new'
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
			redirect_to @article
		else
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
		params[:article].permit(:title,:text,:category_id,:image)
	end
end
