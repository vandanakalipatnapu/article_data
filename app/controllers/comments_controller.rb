class CommentsController < ApplicationController
	 
 before_action :authenticate_user!,only: [:new]
 http_basic_authenticate_with name: "vandana", password: "vandana", only: :destroy

 
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		if @comment.save
			
			redirect_to article_comment_show_path(@article.id) 
		else
			render 'new'
		end
	end

	 def new
	 	# raise params.inspect
		@article = Article.find(params[:article_id])
		@comment = Comment.new
	 end

	def destroy
		@article = Article.find(params[:article_id])
	    @comment = Comment.find(params[:id])
		if 	@comment.destroy
			redirect_to article_comment_show_path(@article.id)
		else
			redirect_to article_comment_show_path(@article.id)
		end
	end

	def edit
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
	end

	def update
		
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to article_comment_show_path(@article.id)
		else
			render 'edit'
		end
	end
	private
		def comment_params
			params[:comment].permit(:commenter,:body)
		end
end
