class UniqueIndexUniversidadeCurso < ActiveRecord::Migration[5.1]
  def change
    add_index :nota_por_cursos, [:universidade_id, :curso_id], :unique => true
  end
end
