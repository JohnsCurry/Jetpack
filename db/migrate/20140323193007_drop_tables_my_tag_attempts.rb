class DropTablesMyTagAttempts < ActiveRecord::Migration
  def change
    drop_table :job_tags
    drop_table :user_tags
  end
end
