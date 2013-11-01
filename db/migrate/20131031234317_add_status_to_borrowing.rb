class AddStatusToBorrowing < ActiveRecord::Migration
  def change
    add_column :borrowings, :status, :string, :default => 'pending'
  end
end
