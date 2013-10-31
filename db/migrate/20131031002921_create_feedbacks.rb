class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :comment
      t.boolean :thumbs_up

      t.timestamps
    end
  end
end
