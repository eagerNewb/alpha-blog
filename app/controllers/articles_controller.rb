class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]


  def index
  	@articles = Article.all
  end

  def new
  	@article = Article.new
  end

  def edit
  end

  def create
  	# render plain: params[:article].inspect #displays the passed parameters on form submit
  	@article = Article.new(article_params)
  	if @article.save
  	  flash['notice'] = "Article was successfully created"
      redirect_to article_path(@article)
  	else

  	  render 'new'
  	end
  end

  def update
  	@article = Article.find(params[:id])
  	if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
   else
   	render 'edit'
   end
  end

  def show
  end

  def destroy
   @article.destroy
    flash[:notice] = "Article was successfully deleted"
  	redirect_to articles_path
  end
  
  private
  def set_article
    @article = Article.find(params[:id]) #get the id of the article
  end
  def article_params #method
  	params.require(:article).permit(:title,:description) #top lvl key is article, permit the values of title and description
  end



end