class CreateProgramadores < ActiveRecord::Migration
  def change
    create_table :programadores do |t|
      t.string :nome

      t.timestamps
    end
  end
end
