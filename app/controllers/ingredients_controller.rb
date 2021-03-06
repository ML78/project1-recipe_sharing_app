class IngredientsController < ApplicationController

  before_action :require_user, except: [:index, :show]
  before_action :require_admin, only: [:edit, :update, :destroy]

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

    #per wikipedia-client gem docs - must require 'wikipedia' to avoid errors with API
    require 'wikipedia'
    @page = Wikipedia.find(@ingredient.name)
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

end
