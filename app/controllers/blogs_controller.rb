class BlogsController < ApplicationController
  def index
    @blogs=Blog.all.order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to root_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blog_params)
    end
    redirect_to root_path
  end

  def destroy
    blog = Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.destroy
    end
    redirect_to root_path
  end


  private
  def blog_params
    params.require(:blog).permit(:title,:content,:image).merge(user_id: current_user.id)
  end

end
