class AddLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :albums, :location, :string
  end
end
