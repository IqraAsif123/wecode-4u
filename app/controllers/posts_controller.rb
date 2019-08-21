class PostsController < ApplicationController
    def new
    end
    def create
        render plain: params[:post].inspe
    end
end
