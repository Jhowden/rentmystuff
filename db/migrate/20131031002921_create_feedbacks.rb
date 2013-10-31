class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :giver_id
      t.string :comment
      t.boolean :thumbs_up

      t.timestamps
    end
  end
end
