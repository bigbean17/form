class CreateDrones < ActiveRecord::Migration[7.0]
  def change
    create_table :drones do |t|
      t.string :SN
      t.string :string
      t.string :brand
      t.string :model

      t.timestamps
    end
  end
end
