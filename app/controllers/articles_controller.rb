class ArticlesController < ApplicationController
  # get /articles/new
  def new
      @article = Article.new
  end
  
  # post /articles
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
    # logger.debug @article.errors.inspect 
      redirect_to @article  
    else
      render :new
    end
  end
  
  # get /article/:id
  def show
    @article = Article.find(params[:id])
  end
  
  # get /articles
  def index
    @articles = Article.all
  end
  
  # get /artcles/:id/edit
  def edit
    @article = Article.find(params[:id]) 
  end
  
  # patch /artcles/:id
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end    
  end
  
  #ストロングパラメータで指定したキーの値を受け取ることを許可
  private
    def article_params
      params.require(:article).permit(:store_name, :adress, :access, :area,
                              :station, :access, :wifi, :plug, :business_hours,
                              :regular_holiday, :phone, :url)
    end
end