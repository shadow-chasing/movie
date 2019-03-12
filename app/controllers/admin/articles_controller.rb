class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin_user!

  def index
    if params[:category].blank?
      @articles = Article.all.most_recent
    else
      @articles = category_attributes.published.most_recent
    end
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    # user assosiation must be made.
    @article = current_admin_user.articles.new(article_params)

    if @article.save
      redirect_to admin_articles_url, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_url, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  # find all categorys matching id
  def category_attributes
    @category_id = Category.find_by(name: params[:category]).id
    articles = Article.where(category_id: @category_id)
    return articles
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

  def article_params
    params.require(:article).permit(:title, :image, :content, :published, :published_at, :category_id)
  end
end
