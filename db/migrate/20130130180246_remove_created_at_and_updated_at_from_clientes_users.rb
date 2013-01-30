class RemoveCreatedAtAndUpdatedAtFromClientesUsers < ActiveRecord::Migration
  def up
    remove_column :clientes_users, :created_at
    remove_column :clientes_users, :updated_at
  end

  def down
    add_column :clientes_users, :created_at, :timestamp
    add_column :clientes_users, :updated_at, :timestamp
  end
end
