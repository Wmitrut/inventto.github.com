class AddClienteToProjetos < ActiveRecord::Migration
  def self.up
    add_column :projetos, :cliente_id, :integer
  end
  def self.down
    remove_column :projetos, :cliente_id
  end
end
