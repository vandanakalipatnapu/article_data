class LikesController < ApplicationController
	def create
        @article=Article.find(params[:article_id])
     if params[:article_id]!=nil && params[:comment_id]!=nil
            @comment=@article.comments.find(params[:comment_id])
        
            @comment.likes.create(user_id:current_user.id)
            @user=User.find(current_user.id)
            UserMailer.like_user(@article.user.email,@comment).deliver_now
            redirect_to @article
        else
            @article.likes.create(user_id:current_user.id)
            @user=User.find(current_user.id)
            UserMailer.like_user(@article.user.email,@article).deliver_now
            redirect_to @article
            # render json: {success: true,message: "Seclected article has been liked",article: @article.likes.count}
        end
    end
end
