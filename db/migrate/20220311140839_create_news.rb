class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string "title"
      t.text "description"
      t.references :users, foreign_key: true, index: true
      t.timestamps
    end
  end
end
