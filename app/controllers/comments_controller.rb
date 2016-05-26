class CommentsController < ApplicationController
	 
 before_action :authenticate_user!,only: [:new]
 http_basic_authenticate_with name: "vandana", password: "vandana", only: :destroy

 
	def create
		@article = Article.find(params[:article_id])
		# @article =Article.find_by(id: article_id)

		@comment = @article.comments.new(comment_params)
		if @comment.save
			render json: {success: true,message: "comment has been created",comment: @comment}
			# redirect_to article_comment_show_path(@article.id) 
		else
			render json: {success: false,message: "comment has not been created",errors: @comment.errors.full_messages} and return
			# render 'new'
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
			render json: {success: true, message: "selected comment has been deleted",comment: @comment}
			# redirect_to article_comment_show_path(@article.id)
		else
			render json: {success: false, message: "selected comment hasnot been deleted",errors: @comment.errors.full_messages} and return
			# redirect_to article_comment_show_path(@article.id)
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
			# redirect_to article_comment_show_path(@article.id)
		else
			# render 'edit'
		end
	end
	private
		def comment_params
			params.permit(:commenter,:body)
		end
end
