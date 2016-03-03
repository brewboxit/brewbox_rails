class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|

      t.string :name
      t.text :description

      t.timestamps null: false
    end

    add_column :polls, :category_id, :integer
  end
end
