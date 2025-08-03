class CreateDayStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :day_statuses do |t|
      t.integer :emotional_score
      t.text :description

      t.timestamps
    end
  end
end
