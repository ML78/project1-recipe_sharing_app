class UsersController < ApplicationController

  before_action :require_user, except:[:new, :create]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.image?
      @cloudinary = Cloudinary::Uploader.upload(params[:user][:image])
      @user.update :image => @cloudinary['url']
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update user_params
    if user.update(user_params)
      if user.image?
        cloudinary = Cloudinary::Uploader.upload(params[:user][:image])
        user.update :image => cloudinary['url']
      end
      redirect_to user
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :email, :password, :password_confirmation)
  end

  def require_same_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end

end
