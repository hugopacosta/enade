class MudarNotaGeralParaNumeric < ActiveRecord::Migration[5.1]
  def change
    change_column :universidades, :nota, :numeric
  end
end
