class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true, null: false
      t.references :track, index: true, null: false
      t.text :body, null: false
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :users
    add_foreign_key :notes, :tracks
  end
end
