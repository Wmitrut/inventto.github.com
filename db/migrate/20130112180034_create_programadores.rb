class CreateProgramadores < ActiveRecord::Migration
  def change
    create_table :programadores do |t|
      t.string :nome
      t.text :descricao
      t.timestamps
    end
  end
end
