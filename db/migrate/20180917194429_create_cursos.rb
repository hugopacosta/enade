class CreateCursos < ActiveRecord::Migration[5.1]
  def change
    create_table :cursos do |t|
      t.text :nome_do_curso

      t.timestamps
    end
  end
end
