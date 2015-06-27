class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :contacts
      t.boolean :searching
      t.integer :salary

      t.timestamps
    end
  end
end
