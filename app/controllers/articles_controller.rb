class ArticlesController < ApplicationController
    include ArticlesHelper  #calls the method from Articles Helper on article params & more
    
    def index
        @articles = Article.all
      end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save
    
        redirect_to article_path(@article)             #links to the

    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy                                #destroys the article

        redirect_to articles_path                   #Links to the articles overview
    end
end
