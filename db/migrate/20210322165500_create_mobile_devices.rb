class CreateMobileDevices < ActiveRecord::Migration[6.1]
  def change
    create_table :mobile_devices do |t|
      t.string :fcm_tocken

      t.timestamps
    end
  end
end
