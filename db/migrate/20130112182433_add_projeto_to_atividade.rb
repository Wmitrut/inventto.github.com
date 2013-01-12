class AddProjetoToAtividade < ActiveRecord::Migration
  def change
    add_column :atividades, :projeto_id, :integer
  end
end
