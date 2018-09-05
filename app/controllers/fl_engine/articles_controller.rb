require_dependency "fl_engine/application_controller"

module FlEngine
  class ArticlesController < ApplicationController
    before_action :load_article, only: [:edit, :destoy, :show, :update]

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to @article
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to @article
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to fl_engine_articles_path
    end

    def index
      @articles = Article.all
    end

    def show; end

    def edit; end

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
