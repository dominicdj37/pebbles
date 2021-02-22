class CreateDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :devices do |t|
      t.string :name
      t.string :type
      t.string :state
      t.integer :port_number
      t.integer :power
      
      t.timestamps
    end
  end
end
