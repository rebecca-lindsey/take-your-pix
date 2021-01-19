class AddUidAndProviderToClients < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :uid, :string
    add_column :clients, :provider, :string
  end
end
