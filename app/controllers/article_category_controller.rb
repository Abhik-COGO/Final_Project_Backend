class ArticleCategoryController < ApplicationController

    skip_before_action :verify_authenticity_token

    # categories and article relation
    def index
        @data = ArticleCategory.all
        render json: @data
    end

end
