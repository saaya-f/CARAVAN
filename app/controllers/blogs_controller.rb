class BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.all
    p "標準出力にのみ反映"
    logger.debug("標準出力とログファイルに記録される")
  end

  def new
    @blog = Blog.new
    #form_withを使うにはインスタンス変数が必要
    #Blog.newからのモデル作成→フォームとBlogモデルが関連付けられる
  end

  def create
    blog = Blog.new(blog_params)
    #今回のモデル名はblogのため、アクション名はblog_params
    binding.pry
    blog.save
    redirect_to blog_path(blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end
  private

  def blog_params
    params.require(:blog).permit(:title, :category, :body)
    #フォームからのデータを受け取れるようになる
  end
end
