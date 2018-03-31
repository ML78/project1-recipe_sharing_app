# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#

class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
end
