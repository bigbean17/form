class CreateDroneInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :drone_infos do |t|
      t.string :mname
      t.string :mid
      t.string :mnumber
      t.string :brand
      t.string :record
      t.string :family
      t.string :line
      t.decimal :weight
      t.decimal :min_weight
      t.decimal :max_weight

      t.timestamps
    end
  end
end
