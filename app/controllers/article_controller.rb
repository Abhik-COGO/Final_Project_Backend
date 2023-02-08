class ArticleController < ApplicationController

    # skip_before_action :verify_authenticity_token
    
    before_action :authorize_request
    before_action :find_article, except: %i[create allArticle readByTitle, pagination] # adding multiple methods in except
    before_action :authenticate, except: %i[create allArticle]

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
        @article.title = params[:title] || @article.title
        @article.content = params[:content] || @article.content
        @article.created = params[:created] || @article.created
        @article.article_url = params[:article_url] || @article.article_url
        @article.save
        render json: @article
    end

    def findByAuthor
        @article = Article.find(params[:id])
        render json: @article
    end

    def delete
        @article = Article.find(params[:id])
        render json: @article
        # for deletion of article and categories relation from join table
        ArticleCategory.where(article_id: @article.id).each{
            |a|
            a.destroy
        }

        @article.destroy
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
        params.permit(:title, :subheading, :content, :created, :article_url, :no_likes, :no_comments)
    end

    def find_article
        @article = Article.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'Article not found' }, status: :not_found
    end
        
    def authenticate
        if(@article && @current_user.id != @article.user_id)
            raise "Not Authorized"
        end
    end
end
