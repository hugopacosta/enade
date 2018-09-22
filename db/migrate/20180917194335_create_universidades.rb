class CreateUniversidades < ActiveRecord::Migration[5.1]
  def change
    create_table :universidades do |t|
      t.string :nome
      t.float :nota

      t.timestamps
    end
  end
end
