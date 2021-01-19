class AddUidAndProviderToPhotographers < ActiveRecord::Migration[6.1]
  def change
    add_column :photographers, :uid, :string
    add_column :photographers, :provider, :string
  end
end
