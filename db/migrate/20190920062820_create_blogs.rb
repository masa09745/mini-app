class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.text :title, null: false
      t.text :content, null: false
      t.text :image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
