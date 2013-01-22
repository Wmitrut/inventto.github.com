class AddDescricaoToProjeto < ActiveRecord::Migration
  def self.up
    add_column :projetos, :descricao, :text
  end

  def self.down
    remove_column :projetos, :descricao
  end
end
