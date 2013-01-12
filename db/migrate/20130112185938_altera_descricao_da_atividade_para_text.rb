class AlteraDescricaoDaAtividadeParaText < ActiveRecord::Migration
  def change
    change_column 'atividades', 'descricao', :text
  end
end
