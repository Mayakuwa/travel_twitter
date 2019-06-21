class PostsController < ApplicationController
  # 変数は、 Rails ではビューではなく、アクションで定義することが一般的
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new

  end

  def create
    # ビューの代わりにリダイレクトさせる
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

end

