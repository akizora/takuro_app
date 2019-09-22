class CreateLibraries < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.text :systemid
      t.text :systemname
      t.text :libkey
      t.text :libid
      t.text :short
      t.text :formal
      t.text :url_pc
      t.text :address
      t.text :pref
      t.text :city
      t.text :post
      t.text :tel
      t.text :geocode
      t.text :category
      t.text :image

      t.timestamps
    end
  end
end
