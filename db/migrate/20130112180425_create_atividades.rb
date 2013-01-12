class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
