class RecipesController < ApplicationController

before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update recipe_params
    redirect_to recipe
  end

  def destroy
    recipe = Recipe.find params[:id]
    recipe.destroy
    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :image, :user_id, category_ids: [], ingredient_ids: [])
  end

  def require_same_user
    recipe = Recipe.find params[:id]
    if current_user != recipe.user
      redirect_to recipes_path
    end
  end


end
