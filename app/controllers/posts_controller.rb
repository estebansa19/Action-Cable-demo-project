class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save!
      ActionCable.server.broadcast 'web_notifications_channel', message: "<li> #{@post.title} - #{@post.description} </li>"
    end
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
