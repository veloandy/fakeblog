class ArticlesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    if @article = Article.create(article_params)
      redirect_to action: "index"
    else
      redirect_to :back, :alert => "Error creating article"
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
