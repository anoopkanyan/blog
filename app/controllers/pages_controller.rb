class PagesController < ApplicationController
  def show
  	@posts = Post.all.order("created_at desc")
  	@trending = @posts.sort_by {|post| post.impressionist_count}.reverse!
  	render template: "pages/#{params[:page]}"
  end	
end
