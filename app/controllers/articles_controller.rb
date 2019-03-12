class ArticlesController < ApplicationController

  def index
    if params[:category].blank?
      @articles = Article.all.most_recent.paginate(:page => params[:page], :per_page => 1)
    else
      @articles = category_attributes.published.most_recent.paginate(:page => params[:page], :per_page => 1)

    end
  end

  def show
    @article = Article.find(params[:id])
    @author = User.find_by(id: @article.user_id)
    # used for back button redirect to catagorys instead of articles.
    @article_category = Category.where(id: @article.category_id)
  end

  # find all categorys matching id
  def category_attributes
     @category_id = Category.find_by(name: params[:category]).id
     articles = Article.where(category_id: @category_id)
     return articles
   end

end
