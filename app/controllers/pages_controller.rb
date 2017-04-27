class PagesController < ApplicationController
  def show
  	@posts = Post.all.order("created_at desc")
  	render template: "pages/#{params[:page]}"
  end	
end
