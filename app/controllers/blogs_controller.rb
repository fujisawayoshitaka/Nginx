class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :show, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'blogは作成されました'
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: 'blogは編集されました'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'blogは削除されました'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
