class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :band, index: true
      t.string :recording, null: false

      t.timestamps null: false
    end
    add_foreign_key :albums, :bands
  end
end
