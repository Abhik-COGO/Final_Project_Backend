class CommentController < ApplicationController

    before_action :authorize_request

    def comment 
        a= Article.find(params[:article_id])
        a.no_of_comments +=1
        a.save
        c=Comment.create(user_id: @current_user.id, article_id: params[:article_id],
                comment_text: params[:comment_text])
        render json: c
    end

    def most_comment
        @comment = Article.order(no_comments: :desc)
        render json: @comment
    end

end
