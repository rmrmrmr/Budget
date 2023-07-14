class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :amount, precision: 10, scale: 2, default: 0.0
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
