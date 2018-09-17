require 'test_helper'

class FaculdadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @faculdade = faculdades(:one)
  end

  test "should get index" do
    get faculdades_url
    assert_response :success
  end

  test "should get new" do
    get new_faculdade_url
    assert_response :success
  end

  test "should create faculdade" do
    assert_difference('Faculdade.count') do
      post faculdades_url, params: { faculdade: { nome: @faculdade.nome, nota: @faculdade.nota } }
    end

    assert_redirected_to faculdade_url(Faculdade.last)
  end

  test "should show faculdade" do
    get faculdade_url(@faculdade)
    assert_response :success
  end

  test "should get edit" do
    get edit_faculdade_url(@faculdade)
    assert_response :success
  end

  test "should update faculdade" do
    patch faculdade_url(@faculdade), params: { faculdade: { nome: @faculdade.nome, nota: @faculdade.nota } }
    assert_redirected_to faculdade_url(@faculdade)
  end

  test "should destroy faculdade" do
    assert_difference('Faculdade.count', -1) do
      delete faculdade_url(@faculdade)
    end

    assert_redirected_to faculdades_url
  end
end
