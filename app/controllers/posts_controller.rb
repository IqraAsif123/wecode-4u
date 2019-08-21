class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
    end
    def create
        @post = Post.new(post_params.merge(user_id: current_user.id))
        
        @post.save
        redirect_to "/user_profile"
    end
    def index
        @posts = Post.all
    end
    def user_profile
    end
    private
  def post_params
    params.require(:post).permit(:title, :description )
  end
  
end
