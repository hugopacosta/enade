require 'test_helper'

class NomePorCursosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nome_por_curso = nome_por_cursos(:one)
  end

  test "should get index" do
    get nome_por_cursos_url
    assert_response :success
  end

  test "should get new" do
    get new_nome_por_curso_url
    assert_response :success
  end

  test "should create nome_por_curso" do
    assert_difference('NomePorCurso.count') do
      post nome_por_cursos_url, params: { nome_por_curso: {  } }
    end

    assert_redirected_to nome_por_curso_url(NomePorCurso.last)
  end

  test "should show nome_por_curso" do
    get nome_por_curso_url(@nome_por_curso)
    assert_response :success
  end

  test "should get edit" do
    get edit_nome_por_curso_url(@nome_por_curso)
    assert_response :success
  end

  test "should update nome_por_curso" do
    patch nome_por_curso_url(@nome_por_curso), params: { nome_por_curso: {  } }
    assert_redirected_to nome_por_curso_url(@nome_por_curso)
  end

  test "should destroy nome_por_curso" do
    assert_difference('NomePorCurso.count', -1) do
      delete nome_por_curso_url(@nome_por_curso)
    end

    assert_redirected_to nome_por_cursos_url
  end
end
