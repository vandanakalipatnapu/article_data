class LikesController < ApplicationController
	def create
        @article=Article.find(params[:article_id])
     if params[:article_id]!=nil && params[:comment_id]!=nil
            @comment=@article.comments.find(params[:comment_id])
            @comment.likes.create(user_id:current_user.id)
            @user=User.find(current_user.id)
            UserMailer.like(@article.user.email).deliver_now
            redirect_to @article
        else
            @article.likes.create(user_id:current_user.id)
            @user=User.find(current_user.id)
            UserMailer.like(@article.user.email).deliver_now
            redirect_to @article
        end
    end
end
