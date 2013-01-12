class CreateHoras < ActiveRecord::Migration
  def change
    create_table :horas do |t|
      t.references :atividade
      t.references :programador
      t.decimal :quantas

      t.timestamps
    end
    add_index :horas, :atividade_id
    add_index :horas, :programador_id
  end
end
