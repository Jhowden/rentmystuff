class CreateRentalDates < ActiveRecord::Migration
  def change
    create_table :rental_dates do |t|
      t.date :date
      t.references :dateable, :polymorphic => true
    end
  end
end
