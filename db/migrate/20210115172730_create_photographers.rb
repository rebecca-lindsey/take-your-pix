class CreatePhotographers < ActiveRecord::Migration[6.1]
  def change
    create_table :photographers do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :location
      t.string :specialty

      t.timestamps
    end
  end
end
