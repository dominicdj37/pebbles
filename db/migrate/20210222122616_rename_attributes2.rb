class RenameAttributes2 < ActiveRecord::Migration[6.1]
  def change
    rename_column :devices, :port_number, :device_port
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    rename_column :devices, :state, :device_state
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    rename_column("devices", "power", "device_power")
  end
end
