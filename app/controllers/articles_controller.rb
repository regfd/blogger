class ArticlesController < ApplicationController
    include ArticlesHelper  #calls the method from Articles Helper on article params & more
    
    def index
        @articles = Article.all
      end

    def show
        @article = Article.find(params[:id])

        @comment = Comment.new
        @comment.article_id = @article.id
        

    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save
    
        flash.notice = "Article '#{@article.title}' is now live!  "

        redirect_to article_path(@article)             #links to the

    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy                                #destroys the article

        flash.notice = "Article '#{@article.title}' is Deleted!"

        redirect_to articles_path                   #Links to the articles overview
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id]) 
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end


end
