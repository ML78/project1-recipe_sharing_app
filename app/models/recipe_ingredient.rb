# == Schema Information
#
# Table name: recipe_ingredients
#
#  id :integer          not null, primary key
#

class RecipeIngredient < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
end
