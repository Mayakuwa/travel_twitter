class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update]}

  # 変数は、 Rails ではビューではなく、アクションで定義することが一般的
  def index
    # descは降順という意味（新しいものから順に並び替える）
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    # ユーザーと投稿を結びつける
    # 以下のコードは @user = User.find_by(id: @post.user_id) と同じ
    @user = @post.user
   #　以下のコードはいいね！数を表示している。countメゾットで数を表示できる
    @likes_count = Like.where(post_id: @post.id).count

  end

  def new
    @post = Post.new
  end

  def create
    # ビューの代わりにリダイレクトさせる
    @post = Post.new(
        content: params[:content],
        user_id: @current_user.id)
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

