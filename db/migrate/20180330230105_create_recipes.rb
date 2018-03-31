class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.text :title
      t.text :description
      t.text :image
      t.integer :user_id

      t.timestamps
    end
  end
end
