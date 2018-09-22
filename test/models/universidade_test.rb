require 'test_helper'

class UniversidadeTest < ActiveSupport::TestCase

  test 'valida nome da universidade' do
    universidade = Universidade.new()
    assert_not universidade.save, "Universidade foi cadastrada sem nome e sem nota!"
  end

  test 'nome da universidade nao esta em branco' do
    universidade = Universidade.new(:nome => " ")
    assert_not curso.save, "Universidade cadastrada com nome em branco"
  end

  test 'nome da universidade unico' do
    universidade1 = Universidade.create(:nome => 'Teste')
    assert universidade1.valid?, "universidade1 inválido #{universidade1.errors.inspect}"

    universidade2 = Universidade.new(:nome => universidade1.nome)
    universidade2.valid?

    assert_not universidade2.save, "Universidade com nome duplicado foi cadastrada!"
  end

  test 'nota geral em branco' do
    universidade = Universidade.new(:nome=>'Teste',:nota => '')
    assert_not universidade.save, "Universidade foi cadastrada sem nota!"
  end

  test 'nota geral negativa' do
    universidade = Universidade.new(:nome=>'Teste',:nota => '-1')
    assert_not universidade.save, "Universidade foi cadastrada com nota negativa!"
  end

end
