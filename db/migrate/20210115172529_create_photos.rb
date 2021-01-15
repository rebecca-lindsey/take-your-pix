class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.date :date
      t.belongs_to :album, foreign_key: true

      t.timestamps
    end
  end
end
