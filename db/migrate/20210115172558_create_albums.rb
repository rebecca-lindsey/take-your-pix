class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.date :date
      t.belongs_to :photographer, foreign_key: true
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
