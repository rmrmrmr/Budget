class AddGroupRefToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :items, :group, null: false, foreign_key: true, index: true
  end
end
