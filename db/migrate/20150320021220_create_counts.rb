class CreateCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :counts do |t|
      t.integer :number
      t.timestamps null: false
    end
  end
end
