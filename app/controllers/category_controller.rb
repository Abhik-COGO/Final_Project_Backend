class CategoryController < ApplicationController

    # skip_before_action :verify_authenticity_token

    before_action :authorize_request
    before_action :authenticate

    def allCategories
        @categories = Category.all
        render json: @categories
    end

    def create
        @category = Category.create(category_name: params[:category_name])
        render json: @category
    end

    def delete
        @category = Category.find_by(id: params[:category_id])
        render json: @categories
        @category.destroy
    end

    def findByCat
        article = []
        ArticleCategory.where(category_id: params[:category_id]).each {
            |articles|
            article.push(Article.where(id: articles.article_id))
        }
        render json: article
    end

    def findById
        @name = Category.find_by(id: params[:category_id])
        render json: @name
    end

    private
    def authenticate
        if (@current_user.id != 1)
            raise "Not authorized"
        end
    end

end
