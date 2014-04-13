class AddTags < ActiveRecord::Migration
  def change
    add_column :tags, :user_id, :integer
    add_column :tags, :job_id,  :integer
  end
end
