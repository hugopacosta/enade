class MudarNotaCursoParaNumeric < ActiveRecord::Migration[5.1]
  def change
    change_column :nota_por_cursos, :nota, :numeric
  end
end
