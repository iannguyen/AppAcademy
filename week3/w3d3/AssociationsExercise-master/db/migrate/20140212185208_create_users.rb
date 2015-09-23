class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.timestamps
    end
    # add_index :table_name, :column_name #, unique: true
    add_index(:users, :email, unique: true)
  end
end
