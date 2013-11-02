class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.boolean :available, default: true
      t.integer :lender_id
      t.integer :price

      t.timestamps
    end
  end
end
