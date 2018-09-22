class AlteraColunaIdFaculdadeParaIdUniversidade < ActiveRecord::Migration[5.1]
  def change
    rename_column :nota_por_cursos, :faculdade_id, :universidade_id
  end
end
