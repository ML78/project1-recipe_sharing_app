class CategoriesController < ApplicationController

  before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:create, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      if @category.image?
        @cloudinary = Cloudinary::Uploader.upload(params[:category][:image])
        @category.update :image => @cloudinary['url']
      end
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update category_params

    if category.update(category_params)
      if category.image?
        cloudinary = Cloudinary::Uploader.upload(params[:category][:image])
        category.update :image => cloudinary['url']
      end
      redirect_to category
    end
  end

  def destroy
    category = Category.find params[:id]
    category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :image, recipe_ids: [])
  end

end
