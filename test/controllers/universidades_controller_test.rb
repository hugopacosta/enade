require 'test_helper'

class UniversidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @universidade = universidades(:one)
  end

  test "should get index" do
    get universidades_url
    assert_response :success
  end

  test "should get new" do
    get new_universidade_url
    assert_response :success
  end

  test "should create universidade" do
    assert_difference('Universidade.count') do
      post universidades_url, params: { universidade: { nome: @universidade.nome, nota: @universidade.nota } }
    end

    assert_redirected_to universidade_url(Universidade.last)
  end

  test "should show universidade" do
    get universidade_url(@universidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_universidade_url(@universidade)
    assert_response :success
  end

  test "should update universidade" do
    patch universidade_url(@universidade), params: { universidade: { nome: @universidade.nome, nota: @universidade.nota } }
    assert_redirected_to universidade_url(@universidade)
  end

  test "should destroy universidade" do
    assert_difference('Universidade.count', -1) do
      delete universidade_url(@universidade)
    end

    assert_redirected_to universidades_url
  end
end
