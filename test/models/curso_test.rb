require 'test_helper'

class CursoTest < ActiveSupport::TestCase

  test 'valida nome do curso' do
    curso = Curso.new
    assert_not curso.save, "Curso foi salvo sem nome!"
  end

  test 'nome do curso nao esta em branco' do
    curso = Curso.new(:nome_do_curso => " ")
    assert_not curso.save, "Curso salvo com nome em branco"
  end

  test 'nome do curso unico' do
    curso1 = Curso.create(:nome_do_curso => 'Teste')
    assert curso1.valid?, "curso1 inválido #{curso1.errors.inspect}"

    curso2 = Curso.new(:nome_do_curso => curso1.nome_do_curso)
    curso2.valid?

    assert_not curso2.save, "Curso com nome duplicado foi salvo!"
  end
end
