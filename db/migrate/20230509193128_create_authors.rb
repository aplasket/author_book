class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.boolean :currently_alive
      t.integer :age

      t.timestamps
    end
  end
end
