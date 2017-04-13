class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
  	@posts = @tag.posts.order("created_at desc").paginate(page: params[:page], per_page: 10)
  end

  
		
	
end
