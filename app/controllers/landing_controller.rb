class LandingController < ApplicationController
  def index
    filter_tag_id=params[:tag]

    @tag=[]
    Tag.all.each do |t|
if  PostTag.where(tag_id: t.id).count() > 0
  @tag << t
end
    end

    if filter_tag_id == nil
      @posts=Post.order("created_at desc").limit(3)
    else
      filter_tag=Tag.find(filter_tag_id)
      @posts=filter_tag.posts.order("created_at desc").limit(3)
    end
  end
 

end
