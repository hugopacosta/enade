class UniqueIndexFaculdadeCurso < ActiveRecord::Migration[5.1]
  def change
    add_index :nota_por_cursos, [:faculdade_id, :curso_id], :unique => true
  end
end
