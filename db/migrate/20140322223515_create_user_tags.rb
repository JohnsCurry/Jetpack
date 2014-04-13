class CreateUserTags < ActiveRecord::Migration
  def change
    create_table :user_tags do |t|
      t.integer :user_id, :tag_id
      t.timestamps
    end
  end
end
