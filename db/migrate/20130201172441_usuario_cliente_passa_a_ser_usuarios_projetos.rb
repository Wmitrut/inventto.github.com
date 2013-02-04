class UsuarioClientePassaASerUsuariosProjetos < ActiveRecord::Migration
  def up
    rename_table :clientes_users, :projetos_users
    rename_column :projetos_users,:cliente_id, :projeto_id
  end

  def down
    rename_column :projetos_users, :projeto_id, :cliente_id
    rename_table  :projetos_users, :clientes_users
  end
end
