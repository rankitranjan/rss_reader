class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_feed, only: [:show, :index]

  def index
    @articles = @feed.articles.order('published_at desc')
  end

  def show
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to feed_articles_path, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_article
      @article = Article.find(params[:id])
    end
    
    def set_feed
      @feed = Feed.find(params[:feed_id])
    end

    def article_params
      params.require(:article).permit(:title, :published, :content, :url, :author, :feed_id)
    end
end
