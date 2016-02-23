class ArticlesController < ApplicationController
  def new
  	@article = Article.new
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

  def show
	@article = Article.find(params[:id]) #grabs the id of the article from the params hash  	
  end
  
  private
  def article_params #method
  	params.require(:article).permit(:title,:description) #top lvl key is article, permit the values of title and description
  end



end