class CreateClientesUsers < ActiveRecord::Migration
  def change
    create_table :clientes_users do |t|
      t.integer :user_id
      t.integer :cliente_id
      t.timestamps
    end
  end
end
