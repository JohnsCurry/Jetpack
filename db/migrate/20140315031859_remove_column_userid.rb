class RemoveColumnUserid < ActiveRecord::Migration
  def change
    remove_column :skills, :user_id
  end
end
