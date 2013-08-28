class ArticlesController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy]
    before_action :correct_user,   only:[:destroy]

	def index

	end
    
    def show
    	@article = Article.find(params[:id])
    end
    def new
    	@article = Article.new
    end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:success] = "发表成功！"
			redirect_to root_url
		else
			render 'new'
		end
	end

	def destroy
		@article.destroy
		redirect_to root_url
	end

    private
       def article_params
       	params.require(:article).permit(:title, :website, :content)
       end

       def correct_user
       	@article = current_user.articles.find_by(id: params[:id])
       	redirect_to root_url if @article.nil?
       end
end
