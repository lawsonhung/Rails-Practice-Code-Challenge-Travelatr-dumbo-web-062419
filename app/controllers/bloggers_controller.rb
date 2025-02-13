class BloggersController < ApplicationController
  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
    @post = Post.new
    @destinations = Destination.all
  end

  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(params.require(:blogger).permit(:name, :bio, :age))
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:id])
    @blogger.update(params.require(:blogger).permit(:name, :bio, :age))
    redirect_to blogger_path(@blogger)
  end

  def destroy
    @blogger = Blogger.find(params[:id])
    @blogger.destroy
  end
end
