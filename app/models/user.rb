# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  image           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord
  has_secure_password
  has_many :recipes

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :image, :presence => true
end
