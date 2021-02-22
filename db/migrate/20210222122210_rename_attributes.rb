class RenameAttributes < ActiveRecord::Migration[6.1]
  def change
    rename_column :devices, :name, :device_name
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    rename_column :devices, :type, :device_type
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  
  end
end
