class WelcomeController < ApplicationController

def index
	@projects = Project.all.limit(3).order("created_at desc")
	@posts = Post.all.limit(25).order("created_at desc") 
  	@trending = @posts.sort_by {|post| post.impressionist_count}.reverse!
end	

end
