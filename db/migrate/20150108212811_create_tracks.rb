class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :album, index: true
      t.text :lyrics
      t.string :listing, null: false

      t.timestamps null: false
    end
    add_foreign_key :tracks, :albums
  end
end
