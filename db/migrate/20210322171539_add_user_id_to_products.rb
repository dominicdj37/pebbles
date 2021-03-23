class AddUserIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :mobile_devices, :user_id, :integer
  end
end
