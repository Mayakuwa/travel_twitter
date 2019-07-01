class PostsController < ApplicationController
  before_action :authenticate_user

  # 変数は、 Rails ではビューではなく、アクションで定義することが一般的
  def index
    # descは降順という意味（新しいものから順に並び替える）
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # ビューの代わりにリダイレクトさせる
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post=Post.find_by(id: params[:id])
  end

  def update
    # 最初にどのidの投稿内容を編集すれば良いか特定する
    @post=Post.find_by(id: params[:id])
    # 投稿内容を更新
    @post.content = params[:content]
    #　もし投稿がバリデーションに引っかかったら、編集ページにリダイレクトするようにする
    # railsではフラッシュを表示するための特別な変数が用意されている。flash[:notice] = "表示したい文字列"　で書く
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      # rederメゾットを用いると、editアクションを通さず、viewを表示できる
      # redirectさせると、editアクションを経由して、編集する前の元データの投稿を表示させてしまうため。せっかく編集した内容が水の泡になってしまう。
      # render("フォルダー名/ファイル名")　で記述
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
end

