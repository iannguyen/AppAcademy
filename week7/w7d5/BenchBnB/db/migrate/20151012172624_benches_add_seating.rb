class BenchesAddSeating < ActiveRecord::Migration
  def change
    add_column(:benches, :seating, :integer, default: 2)
  end
end
