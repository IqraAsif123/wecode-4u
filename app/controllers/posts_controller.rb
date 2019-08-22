class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
      @post = Post.new
    end
    def create
        @post = Post.new(post_params.merge(user_id: current_user.id))
        
        if @post.save
        redirect_to "/user_profile"
        else
          print @post.errors.full_messages
          render 'new'
        end
    end
    def index
        @posts = Post.all
    end
    def user_profile
      @current_user_posts = Post.where(user_id: current_user.id)
    end
    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to user_profile_path
    end
    private
  def post_params
    params.require(:post).permit(:title, :description )
  end
  PostsController#user_profile is missing a template for request formats: text/html
end
