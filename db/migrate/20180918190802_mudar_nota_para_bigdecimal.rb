class MudarNotaParaBigdecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :nota_por_cursos, :media_alunos, :numeric
  end
end
