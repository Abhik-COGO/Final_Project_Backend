class CategoryController < ApplicationController

    skip_before_action :verify_authenticity_token

    def allCategories
        @categories = Category.all
        render json: @categories
    end

    def create
        @category = Category.create(category_name: params[:category_name])
        render json: @category
    end

    def delete
        @category = Category.find(params[:category_id])
        render json: @categories
        @category.destroy
    end

    def findByCat
        @article = []
        ArticleCategory.where(category_id: params[:category_id]).each {
            |a|
            @article.push(Article.where(id: a.article_id))
        }
        render json: @article
    end

    def findById
        @name = Category.find(params[:category_id])
        render json: @name
    end
end
