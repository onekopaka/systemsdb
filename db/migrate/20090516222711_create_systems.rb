class CreateSystems < ActiveRecord::Migration
  def self.up
    create_table :systems do |t|
      t.string :Make
      t.string :Model
      t.string :CPU_Family
      t.string :CPU_Clock_Speed
      t.integer :RAM_Amount_MB
      t.string :Hard_Drive_Capacity_GB
      t.date :Aquired_Date
      t.string :Owner_Full_Name
      t.string :Owner_Email
      t.integer :Owner_Phone
      t.integer :Barcode
      t.timestamps
    end
  end
  
  def self.down
    drop_table :systems
  end
end
