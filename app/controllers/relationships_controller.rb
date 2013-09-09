class RelationshipsController < ApplicationController
	before_action :signed_in_user

	def create
		@article = Article.find(params[:relationship][:article_id])
		if current_user.uped?(@article)
			redirect_to root_path
			flash[:error] = "对不起，你只能顶一次！"
		elsif current_user.up!(@article)
		   redirect_to root_path
		   flash[:success] = "success！"
		end
	end

	def destroy
		
	end
end