class MudarNotaGeralParaNumeric < ActiveRecord::Migration[5.1]
  def change
    change_column :faculdades, :nota, :numeric
  end
end
