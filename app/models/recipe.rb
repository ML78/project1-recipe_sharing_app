# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  title       :text
#  description :text
#  image       :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Recipe < ApplicationRecord
  belongs_to :user, :optional => true
  has_and_belongs_to_many :categories
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, :presence => true
  validates :image, :presence => true
end
