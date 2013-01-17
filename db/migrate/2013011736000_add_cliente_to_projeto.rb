class AddClienteToProjeto < ActiveRecord::Migration
  def change
    add_column :projetos, :cliente_id, :integer
  end
end
