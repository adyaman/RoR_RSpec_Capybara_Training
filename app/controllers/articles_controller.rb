class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end
  def create
    @article = Article.new(@article_param)
    @article.save
    flash[:success] = "Article has been created"
    redirect_to articles_path
  end
end
