class AddPopularflgToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :popularflg, :string
  end
end
