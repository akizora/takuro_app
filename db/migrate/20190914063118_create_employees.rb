class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name, null: true
      t.string :department, null: true
      t.integer :gender, null: true
      t.date :birth, null: true
      t.date :joined_date, null: true
      t.bigint :payment, null: true
      t.text :note, null: true

      t.timestamps
      t.integer :lock_version
    end
  end
end