class AddDatesToBorrowings < ActiveRecord::Migration
  def change
    add_column :borrowings, :dates, :string
  end
end
