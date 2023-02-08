class LikeController < ApplicationController

    before_action :authorize_request

    def like
        article = Article.find(parmas[:id])
        like = article.likes.find_by(user_id: @current_user.id)
       
        if(like?)
            like.destroy
            article.no_likes -= 1;
        else
            article.likes.create(user_id: @current_user.id)
            article.no_likes += 1;
        end
        article.save
        render json: article
    end

    def most_likes
        @like = Article.order(no_likes: :desc)
        render json: @like
    end

end
