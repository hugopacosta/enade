class CreateNotaPorCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :nota_por_cursos do |t|
      t.integer :faculdade_id
      t.integer :curso_id
      t.float :nota
      t.float :media_alunos

      t.timestamps
    end
  end
end
