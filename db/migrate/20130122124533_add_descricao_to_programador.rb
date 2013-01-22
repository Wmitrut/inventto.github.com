class AddDescricaoToProgramador < ActiveRecord::Migration
  def self.up
    add_column :programadores, :descricao, :text
  end
  def self.down
    remove_column :programadores, :descricao
  end
end
