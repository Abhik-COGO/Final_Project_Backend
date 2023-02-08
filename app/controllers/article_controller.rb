class ArticleController < ApplicationController

    # skip_before_action :verify_authenticity_token
    before_action :authorize_request

    def allArticle
        @article = Article.all
        render json: @article
    end

    def create
        @user = User.find(params[:user_id])
        @article = @user.articles.create(user_params)
        cat_arr = params[:categories]
        cat_arr.each{
            |cat_arr|
            ArticleCategory.create(article_id: @article.id, category_id: cat_arr)
        }

        render json: @article
    end


    def update
        @article = Article.find(params[:article_id])
        @article.title = params[:title] || @article.title
        @article.content = params[:content] || @article.content
        @article.created = parmas[:created] || @article.created
        @article.article_url = parmas[:article_url] || @article.article_url
        @article.save
        render json: @article
    end

    def findById
        @article = Article.find(params[:id])
        render json: @article
    end

    def delete
        @article = Article.find(params[:id])
        render json: @article
        # for deletion of article and categories relation from join table
        ArticleCategory.where(article_id: article.id).each{
            |a|
            a.delete
        }

        @article.delete
    end

    def pagination
        pageLimit = 4
        pageNo = params[:page].to_i
        articles = Article.limit(pageLimit).offset((pageNo-1)*pageLimit)
        render json: articles
    end

    def readByTitle
        article = Article.where("title LIKE ?", "%#{params[:title]}%")
        render json: article
    end

    private
    def user_params
        params.permit(:title, :subheading, :content, :created, :article_url)
    end
end
