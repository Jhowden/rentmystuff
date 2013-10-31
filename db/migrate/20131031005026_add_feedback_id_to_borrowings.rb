class AddFeedbackIdToBorrowings < ActiveRecord::Migration
  def change
    add_column :borrowings, :feedback_id, :integer
  end
end
