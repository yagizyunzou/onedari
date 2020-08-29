class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :url
      t.text :comment
      t.string :image
      t.string :price

      t.timestamps
    end
  end
end
