class BlogsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @blog = Blog.new
    #form_withを使うにはインスタンス変数が必要
    #Blog.newでからのモデル作成→フォームとBlogモデルが関連付けられる
  end

  def create
    blog = Blog.new(blog_params)
    #k今回のモデル名はblogのため、アクション名はblog_params
    blog.save
    redirect_to blogs_path
  end

  def edit
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :categori, :body)
    #フォームからのデータを受け取れるようになる
  end
end
