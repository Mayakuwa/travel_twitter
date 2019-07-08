class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbit_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :not_correct_user, {only: [:edit, :update]}


  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
        name: params[:name],
        email: params[:email],
        password: params[:password],
        image_name: "default_user.jpg"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました！！"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]

    #画像を保存する処理
    # 1. paramsで画像を受け取っているか確認。　2. データベースの中に、image_nameを保存（ユーザーの名前で保存）　
    # 3　paramsで画像を再び受け取る　4. 画像データをもとに画像を作成。image.readで画像を読む
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(
            email: params[:email])
    # bcryptによって、受け取ったパスワードと、password_digustに登録されている暗号化されたパスワードが正しいか判断する
    # ＝　authenticateメゾットが使えるようになる
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました！！お帰りなさい"
      redirect_to("/posts/index")
    else
      @error_messages = "ユーザー名、またはパスワードが違います"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました！"
    redirect_to("/login")
  end

  def likes
    @user = User.find_by(id: params[:id])
    # ユーザーがいいねした投稿を全て表示
    @likes = Like.where(user_id: @user.id)
  end

end

