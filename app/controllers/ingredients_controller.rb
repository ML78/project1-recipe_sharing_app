class IngredientsController < ApplicationController

  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new ingredient_params
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update ingredient_params
    redirect_to ingredient
  end

  def destroy
    ingredient = Ingredient.find params[:id]
    ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, recipe_ids: [])
  end

  def require_same_user
    recipe = Recipe.find params[:id]
    if current_user != recipe.user
      redirect_to recipes_path
    end
  end

end
