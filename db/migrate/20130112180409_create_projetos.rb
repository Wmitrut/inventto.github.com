class CreateProjetos < ActiveRecord::Migration
  def change
    create_table :projetos do |t|
      t.string :nome
      t.decimal :valor_hora

      t.timestamps
    end
  end
end
