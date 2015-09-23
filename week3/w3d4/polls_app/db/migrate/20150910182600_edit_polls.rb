class EditPolls < ActiveRecord::Migration
  def change
    remove_column :polls, :author
    add_column :polls, :author_id, :integer
    add_column :questions, :poll_id, :integer
  end
end
