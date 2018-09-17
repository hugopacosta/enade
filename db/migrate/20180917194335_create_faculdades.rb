class CreateFaculdades < ActiveRecord::Migration[5.1]
  def change
    create_table :faculdades do |t|
      t.string :nome
      t.float :nota

      t.timestamps
    end
  end
end
