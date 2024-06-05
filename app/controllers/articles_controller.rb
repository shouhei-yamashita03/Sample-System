class ArticlesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end

    def show
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "記事が作成されました。"
            redirect_to @article
        else
            flash.now[:error] = "記事の作成に失敗しました。入力内容を確認してください。"
            render :new
        end
    end

    def edit
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "記事が更新されました。"
            redirect_to @article
        else
            flash.now[:error] = "記事の更新に失敗しました。入力内容を確認してください。"
            render :edit
        end
    end

    def destroy
        @article.destroy
        flash[:success] = "記事を削除しました。"
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :content, :image)
    end
end
