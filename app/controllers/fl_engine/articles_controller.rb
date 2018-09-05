require_dependency "fl_engine/application_controller"

module FlEngine
  class ArticlesController < ApplicationController
    before_action :load_article, only: [:show]

    def create
      @article = Article.new(article_params.merge({ postable_id: current_user.id,
                                                    postable_type: current_user.class.name }))
      if @article.save
        redirect_to @article
      else
        render :new
      end
    end

    def index
      @articles = current_user.articles
    end

    def show; end

    def new
      @article = Article.new
    end

    private

    def load_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
  end
end
