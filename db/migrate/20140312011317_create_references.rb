class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|

      t.string :name
      t.string :relationship
      t.string :phone
      t.string :email
      t.string :company
      t.text   :comments
      t.timestamps

    end
  end
end
