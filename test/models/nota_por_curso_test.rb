require 'test_helper'

class NotaPorCursoTest < ActiveSupport::TestCase

  test 'nota curso negativa' do
    nota_por_curso = NotaPorCurso.new(:universidade_id=>'1',:curso_id=>'1',:nota => '-1',:media_alunos => '2')
    assert_not nota_por_curso.save, "Nota do curso negativa foi cadastrada!"
  end

  test 'media alunos negativa' do
    nota_por_curso = NotaPorCurso.new(:universidade_id=>'1',:curso_id=>'1',:nota => '1',:media_alunos => '-2')
    assert_not nota_por_curso.save, "Nota do curso negativa foi cadastrada!"
  end

end
