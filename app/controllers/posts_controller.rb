class PostsController < ApplicationController
    before_action :authenticate_user!

    def new
      @post = Post.new
    end
    def create
        tags = params[:post][:tag].split(" ")
        tag_rows=[]
        tags.each do |tag|
           tag_rows <<Tag.find_or_create_by(name: tag)
        end
        @post = Post.new(post_params.merge(user_id: current_user.id))
        if @post.save
          tag_rows.each do |tag_row|
            PostTag.create(post_id: @post.id, tag_id: tag_row.id)
          end
  

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
    params.require(:post).permit(:title, :description)
  end
  PostsController#user_profile is missing a template for request formats: text/html
end
