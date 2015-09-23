class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.string :author, null: false
    end

    add_index(:polls, [:title,:author])
  end
end
