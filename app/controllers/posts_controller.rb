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

    def update
      @post = Post.find(params[:id])
      if (@post.update(post_params))
        redirect_to post_path(@post)
        else
          render 'edit'
        end
    end

    def show
      @post = Post.find(params[:id])
    end

    def edit
      @post = Post.find(params[:id])
    end
    def contact
    end
    
    private
  def post_params
    params.require(:post).permit(:title, :description )
  end
  PostsController#user_profile is missing a template for request formats: text/html
end
