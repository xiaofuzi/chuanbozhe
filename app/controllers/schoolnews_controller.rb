class SchoolnewsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy]

    def index
    	@schoolnewses = []
    	@schoolnewses = Schoolnews.all
    	@schoolnews = @schoolnewses.paginate(page: params[:page])
    end

    def show
  	    @schoolnewses = []
        @schoolnewses = Schoolnews.all
        
    end

	def new
		@schoolnew = Schoolnews.new
	end

	def create
        @schoolnew = current_user.schoolnews.build(schoolnews_params)
		if @schoolnew.save
			flash[:success] = "发表成功！"
			redirect_to schoolnews_index_path
		else
			render 'new'
		end
	end

	def destroy
		@schoolnew.destroy
		redirect_to schoolnews_index_path
	end

    private
       def schoolnews_params
       	params.require(:schoolnews).permit(:title, :site, :content)
       end

       def correct_user
       	@schoolnews = current_user.schoolnews.find_by(id: params[:id])
       	redirect_to root_url if @schoolnews.nil?
       end
end
