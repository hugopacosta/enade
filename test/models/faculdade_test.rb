require 'test_helper'

class FaculdadeTest < ActiveSupport::TestCase

  test 'valida nome da faculdade' do
    faculdade = Faculdade.new()
    assert_not faculdade.save, "Faculdade foi cadastrada sem nome e sem nota!"
  end

  test 'nome da faculdade nao esta em branco' do
    faculdade = Faculdade.new(:nome => " ")
    assert_not curso.save, "Faculdade cadastrada com nome em branco"
  end

  test 'nome da faculdade unico' do
    faculdade1 = Faculdade.create(:nome => 'Teste')
    assert faculdade1.valid?, "faculdade1 inválido #{faculdade1.errors.inspect}"

    faculdade2 = Faculdade.new(:nome => faculdade1.nome)
    faculdade2.valid?

    assert_not faculdade2.save, "Faculdade com nome duplicado foi cadastrada!"
  end

  test 'nota geral em branco' do
    faculdade = Faculdade.new(:nome=>'Teste',:nota => '')
    assert_not faculdade.save, "Faculdade foi cadastrada sem nota!"
  end

  test 'nota geral negativa' do
    faculdade = Faculdade.new(:nome=>'Teste',:nota => '-1')
    assert_not faculdade.save, "Faculdade foi cadastrada com nota negativa!"
  end

end
