class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # 全コントローラーで共通の処理をしたいときは、application_controlleにまとめる！！
  # Beforeメゾットでアクションを呼び出す前に、set_current_userを呼び出すことができる！！

  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # @で定義した変数は、違うクラス内でも利用可
  # ユーザーがログインしてないときのアクセス制限
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  #ユーザーがログインしているときのアクセス制限
  def forbit_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  # ログインしているユーザーが他の人のプロフィールにアクセスできないようにする
  # params[:id]で取得できるのは、文字列なので、to_iで数値に変換する！
  def not_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
  end

  # ログインしているユーザーが、投稿を変更する権限を持っているかどうか
  def ensure_correct_user
    #まず@postを定義する！！！
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end
