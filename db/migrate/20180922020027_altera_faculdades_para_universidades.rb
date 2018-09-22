class AlteraFaculdadesParaUniversidades < ActiveRecord::Migration[5.1]
  def change
    rename_table :faculdades, :universidades
  end
end
