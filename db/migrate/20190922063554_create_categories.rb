class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :libcategory
      t.string :group

      t.timestamps
    end
  end
end
